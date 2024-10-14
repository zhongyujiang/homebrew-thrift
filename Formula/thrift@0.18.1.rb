class ThriftAT0181 < Formula
  desc "Framework for scalable cross-language services development"
  homepage "https://thrift.apache.org"
  url "https://github.com/apache/thrift/archive/refs/tags/v0.18.1.tar.gz"
  sha256 "9cea30b9700153329ae1926cc05a20bbe3e8451ae270b0c8c5c5fe9929924cb3"
  license "Apache-2.0"

  keg_only :versioned_formula

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "bison" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "boost"
  depends_on "openssl@1.1"

  uses_from_macos "flex" => :build

  def install
    args = %w[
      --without-erlang
      --without-haskell
      --without-java
      --without-perl
      --without-php
      --without-php_extension
      --without-python
      --without-ruby
      --without-swift
      --disable-tests
      --disable-tutorial
    ]

    ENV.cxx11 if ENV.compiler == :clang

    # Don't install extensions to /usr
    ENV["JAVA_PREFIX"] = pkgshare/"java"

    # We need to regenerate the configure script since it doesn't have all the changes.
    system "./bootstrap.sh"

    system "./configure", *std_configure_args, *args
    ENV.deparallelize
    system "make", "install"
  end

  test do
    assert_match "Thrift", shell_output("#{bin}/thrift --version")
  end
end
