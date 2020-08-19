package net.novazy.spark.demo

import scala.math.random
import scala.math.sqrt

import org.apache.spark.SparkConf
import org.apache.spark.SparkContext
import org.apache.spark.rdd.RDD

object main {
  // demo <core count>
  def main(args: Array[String]): Unit = {
    val conf: SparkConf = new SparkConf().setMaster("local[*]").setAppName("SparkDemo")
    val sc = new SparkContext(conf)

    // slices
    val slices = if (args.length > 0) args(0).toInt else 2
    val n = math.min(100000L * slices, Int.MaxValue).toInt

    // 2-norm
    val listRdd: RDD[Int] = sc.makeRDD(1 to n)
    val integral = sc.parallelize(1 until n, slices).map { i =>
      val x = random * 0.789
      1/sqrt((1-x*x)*(1-0.7*x*x))
    }.reduce(_ + _)
    println(s"integrate \\int^{0.789}_{0} dt/\\sqrt{(1-t^2)(1-0.7t^2)} : ${0.789/n*integral}")

    // calculate pi
    val count = sc.parallelize(1 until n, slices).map { i =>
      val x = random * 2 - 1
      val y = random * 2 - 1
      if (x*x + y*y <= 1) 1 else 0
    }.reduce(_ + _)
    println(s"Pi is roughly ${4.0 * count / (n - 1)}")
  }
}
