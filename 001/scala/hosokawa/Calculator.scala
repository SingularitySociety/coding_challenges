object Calculator {

  //log10の切り上げの値を取得する関数
  @tailrec
  private def log10(n: Int, r: Int = 1): Int = {
    if (Math.pow(10, r) > n)
      r
    else
      log10(n, r + 1)
  }

  //各桁の数を掛け合わせる関数
  private def fold(n: Int): Int = {
    val log = log10(n)

    @tailrec
    def f(n: Int, l: Int, r: Int = 1): Int = {
      if (l == 0)
        r
      else {
        val k = n / Math.pow(10, l - 1).toInt
        val m = n - (Math.pow(10, l - 1).toInt * k)
        f(m, l - 1, k * r)
      }
    }
    f(n, log)
  }

  //max以下の最大の数を探す
  def calc(max: Int): (Int, Int) = {

    //一桁になるまでの折りたたみ回数を計算
    @tailrec
    def foldCount(n: Int, r: Int = 0): Int = {
      if (n < 10)
        r
      else
        foldCount(fold(n), r + 1)
    }

    @tailrec
    def g(n: Int, r: (Int, Int) = (0, 0)): (Int, Int) = {
      if (n == 1)
        r
      else {
        val c = foldCount(n)
        if (c > r._2)
          g(n - 1, (n, c))
        else
          g(n - 1, r)
      }
    }
    g(max)
  }
}

