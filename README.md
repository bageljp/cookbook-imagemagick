What's ?
===============
chef で使用する ImageMagick の cookbook です。

Usage
-----
cookbook なので berkshelf で取ってきて使いましょう。

* Berksfile
```ruby
source "https://supermarket.chef.io"

cookbook "imagemagick", git: "https://github.com/bageljp/cookbook-imagemagick.git"
```

```
berks vendor
```

Recipes
----------

#### imagemagick::default
imagemagickのインストール。

#### imagemagick::custom_ver
依存関係のパッケージとImageMagickをrpmからインストールする。  
古いPJで使ったやつなので動かないかも。  
依存パッケージが手間なのでメモ代わり。

Attributes
----------

主要なやつのみ。

#### imagemagick::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><tt>['imagemagick']['rpm']</tt></td>
    <td>string</td>
    <td>rpmでインストールする場合のrpmのファイル名。</td>
  </tr>
  <tr>
    <td><tt>['imagemagick']['url']</tt></td>
    <td>string</td>
    <td>rpmでインストールする場合にrpmが置いてあるURL。rpmbuildしたものをs3とかに置いておくといいかも。</td>
  </tr>
</table>

