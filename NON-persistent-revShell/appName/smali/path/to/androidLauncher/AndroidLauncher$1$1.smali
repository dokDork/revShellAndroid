.class Lde/fgerbig/spacepeng/android/AndroidLauncher$1$1;
.super Ljava/lang/Object;
.source "AndroidLauncher.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic this$1:Lde/fgerbig/spacepeng/android/AndroidLauncher$1;

.field private final val$in:Ljava/io/InputStream;

.field private final val$out:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Lde/fgerbig/spacepeng/android/AndroidLauncher$1;Ljava/io/InputStream;Ljava/io/OutputStream;)V
    .locals 0

    .prologue
    iput-object p1, p0, Lde/fgerbig/spacepeng/android/AndroidLauncher$1$1;->this$1:Lde/fgerbig/spacepeng/android/AndroidLauncher$1;

    iput-object p2, p0, Lde/fgerbig/spacepeng/android/AndroidLauncher$1$1;->val$in:Ljava/io/InputStream;

    iput-object p3, p0, Lde/fgerbig/spacepeng/android/AndroidLauncher$1$1;->val$out:Ljava/io/OutputStream;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    const/16 v0, 0x400

    new-array v0, v0, [B

    :goto_0
    :try_start_0
    iget-object v1, p0, Lde/fgerbig/spacepeng/android/AndroidLauncher$1$1;->val$in:Ljava/io/InputStream;

    invoke-virtual {v1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-lez v1, :cond_0

    iget-object v2, p0, Lde/fgerbig/spacepeng/android/AndroidLauncher$1$1;->val$out:Ljava/io/OutputStream;

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v3, v1}, Ljava/io/OutputStream;->write([BII)V

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    :cond_0
    return-void
.end method
