# Jekyll Github 연동하기
<p>참고 링크</p>
<ul>
<li>오라일리 ebook <strong>Static Site Generator</strong></li>
<li><a href="http://ilmol.com/2015/01/%EC%9B%8C%EB%93%9C%ED%94%84%EB%A0%88%EC%8A%A4%EC%97%90%EC%84%9C%20Jekyll%EB%A1%9C%20%EB%A7%88%EC%9D%B4%EA%B7%B8%EB%A0%88%EC%9D%B4%EC%85%98.html" rel="nofollow">ilmol님 블로그</a></li>
<li><a href="https://nolboo.github.io/blog/2013/10/15/free-blog-with-github-jekyll/" rel="nofollow">nolboo님 블로그</a></li>
<li><a href="https://www.codecademy.com/en/courses/deploy-a-website/" rel="nofollow">codecademy deploy</a></li>
<li><a href="https://xho95.github.io/blog/github/pages/jekyll/minima/theme/2017/03/04/Jekyll-Blog-with-Minima.html" rel="nofollow">xho95님 블로그</a></li>
<li><a href="http://blog.saltfactory.net/jekyll/upgrade-github-pages-dependency-versions.html" rel="nofollow">saltfactory 블로그</a></li>
</ul>
<hr>
<p>목차</p>
<ol>
<li>소개</li>
<li>설치와 GitHub 연동</li>
<li>구동 방식</li>
</ol>
<h2><a id="user-content-1-소개" class="anchor" aria-hidden="true" href="#1-소개"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>1. 소개</h2>
<h3><a id="user-content-11-등장-배경" class="anchor" aria-hidden="true" href="#11-등장-배경"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>1.1 등장 배경</h3>
<ul>
<li>웹 사이트의 발전: static -&gt; dynamic
<ul>
<li>static: DB 통신 없이 html, css 등의 정적 파일의 text를 바로 전달한다. 단순해서 빠르지만 자체 기능이 부족하고, 콘텐츠 수정이 힘들다.</li>
<li>dynamic: DB와 연동하여 댓글, 좋아요 등 다양한 기능이 가능하고, 콘텐츠 수정, 추가가 용이하다.</li>
</ul>
</li>
<li>하지만 개인 블로그나 간단한 사이트의 경우 필요로 하는 기능이 많지 않다. 대표적인 추가 기능들(댓글, form, 글 검색 등)이 각각 서비스화되면서(disqus, wufoo, typeform, google 등등) 정적 사이트로 블로그를 만들더라도 원하는 대부분의 기능을 충족할 수 있게 됐다.</li>
<li>정적 사이트 엔진이 Jekyll 말고도 무려 400개나 된다.(<a href="https://staticsitegenerators.net/" rel="nofollow">참고링크</a>)</li>
<li>Jekyll 창시자가 GitHub의 창업자이자 전 CEO인 Tom Preston-Werner다. 괜히 GitHub에서 호스팅도 제공하고 GitHub Pages에서도 자주 사용되는 등의 연결고리가 있는게 아니다. 현재는 <a href="https://github.com/parkr">Parker Moore</a>(GitHub 직원)가 리딩하고 있다.</li>
<li>Jekyll은 ruby 언어 기반이지만 엔진을 커스텀해서 사용할 것이 아니라면 루비 문법을 알 필요는 없다.</li>
</ul>
<h3><a id="user-content-12-단순-소개-페이지를-원한다면" class="anchor" aria-hidden="true" href="#12-단순-소개-페이지를-원한다면"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>1.2 단순 소개 페이지를 원한다면</h3>
<ul>
<li>만약 단순히 어떤 페이지 하나를 소개 목적으로 만들고 싶은거라면(예: <a href="http://hunkim.github.io/ml/" rel="nofollow">모두의 딥러닝 페이지</a>) 정말 간단해진다. Jekyll까지 갈 필요도 없다.</li>
<li>GitHub pages와 <a href="https://help.github.com/articles/creating-a-github-pages-site-with-the-jekyll-theme-chooser/">Jekyll Theme Chooser</a>를 이용해서 테마 샘플 하나 선택하고, 내용은 <code>README.md</code> 파일로 대체하면 된다.</li>
</ul>
<h2><a id="user-content-2-설치와-github-연동" class="anchor" aria-hidden="true" href="#2-설치와-github-연동"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>2. 설치와 GitHub 연동</h2>
<h3><a id="user-content-21-ruby-설치" class="anchor" aria-hidden="true" href="#21-ruby-설치"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>2.1 Ruby 설치</h3>
<ul>
<li>OS X
<ul>
<li>기본적으로 Ruby가 설치되어있지만, 구버전일 수도있어서 업데이트해야 한다고한다.</li>
<li>Homebrew 패키지 매니저 설치 : <code>/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"</code></li>
<li>루비 설치 : <code>brew install ruby</code></li>
</ul>
</li>
<li>Window
<ul>
<li>루비 설치파일(2.4 버전 이상)을 다운받고 실행 : <a href="https://rubyinstaller.org/downloads/" rel="nofollow">https://rubyinstaller.org/downloads/</a></li>
<li>블로그 글 검색에서 DevKit을 설치하라는 건 2.4 미만 버전에 대한 것이므로 무시한다.</li>
<li>설치 마지막에 <code>MSYS2</code>에 대한 언급이 있는데 설치해준다. 새 창이 떠서 1, 2, 3 중에 선택하라고 하는데 1번 정도까지는 추가로 설치해주자. 그 후엔 그냥 엔터 쳐서 종료.</li>
</ul>
</li>
</ul>
<h3><a id="user-content-22-라이브러리-설치" class="anchor" aria-hidden="true" href="#22-라이브러리-설치"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>2.2 라이브러리 설치</h3>
<ul>
<li>OS X : 터미널 열고 <code>sudo gem install jekyll bundler</code></li>
<li>Window: cmd 열고 <code>gem install jekyll bundler</code></li>
</ul>
<h3><a id="user-content-23-github-연동" class="anchor" aria-hidden="true" href="#23-github-연동"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>2.3 GitHub 연동</h3>
<ul>
<li>
<p>저장소 생성: GitHub에서 <code>username.github.io</code> 이름으로 repository를 만든다. username은 자신의 것으로 대체. 내 경우는 GitHub username이 'gyubin'이라서 <a href="http://gyubin.github.io/" rel="nofollow">gyubin.github.io</a>로 했다.</p>
</li>
<li>
<p>생성된 빈 repository를 clone하고(ex: <code>git clone git@github.com:Gyubin/gyubin.github.io.git</code>) 해당 디렉토리로 들어간다.</p>
</li>
<li>
<p>내 로컬의 저장소에 들어간 상태에서 아래 명령어 순차 실행</p>
<ul>
<li>new 뒤에 이름을 지정해서 새로운 디렉토리를 만드는 것이 일반적인데 우리는 로컬 저장소 디렉토리에 있기 때문에 현재 디렉토리로 <code>.</code> 지정해서 그냥 파일만 생성한다.</li>
<li>로컬 서버 실행(<code>http://localhost:4000/</code>)되는 동안엔 파일 변화가 바로바로 적용된다. 미리보기 가능.</li>
</ul>
<div class="highlight highlight-source-shell"><pre>jekyll new <span class="pl-c1">.</span>
bundle <span class="pl-c1">exec</span> jekyll serve</pre></div>
</li>
<li>
<p>만들어진 파일을 실제 적용하고 싶다면 아래처럼 모든 파일을 commit하고 push하면 된다. 잠시 기다리면 내 주소(<a href="http://gyubin.github.io/" rel="nofollow">http://gyubin.github.io/</a>)에서 미리보기에서 봤던 내용이 뜰 것이다.</p>
<div class="highlight highlight-source-shell"><pre>git add <span class="pl-c1">.</span> <span class="pl-c"><span class="pl-c">#</span> 모든 파일을 stage로</span>
git commit -m <span class="pl-s"><span class="pl-pds">"</span>Initialize Blog<span class="pl-pds">"</span></span> <span class="pl-c"><span class="pl-c">#</span> commit 하기</span>
git push</pre></div>
</li>
</ul>
<p>기본적으로 한 사이클은 돌았다. 앞으로 할 일은 웹사이트를 구성하는 html, css, js 파일들을 입맛에 맞게 수정하면 된다.</p>
<h2><a id="user-content-3-jekyll-디렉토리-구조" class="anchor" aria-hidden="true" href="#3-jekyll-디렉토리-구조"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>3. Jekyll 디렉토리 구조</h2>
<p>Jekyll은 말 그대로 Static site generator다. 정해진 디렉토리에, 정해진 양식대로 파일을 넣으면 내 웹 사이트를 구성하는 html 파일들을 생성한다. 그리고 디렉토리 path와 동일하게 URI로 접근할 수 있다. 아래가 기본적인 파일 트리 구성이다.</p>
<pre><code>.
├── _config.yml
├── _data
|   └── members.yml
├── _drafts
|   ├── begin-with-the-crazy-ideas.md
|   └── on-simplicity-in-technology.md
├── _includes
|   ├── footer.html
|   └── header.html
├── _layouts
|   ├── default.html
|   └── post.html
├── _posts
|   ├── 2007-10-29-why-every-programmer-should-play-nethack.md
|   └── 2009-04-26-barcamp-boston-4-roundup.md
├── _sass
|   ├── _base.scss
|   └── _layout.scss
├── _site
├── .jekyll-metadata
└── index.html # can also be an 'index.md' with valid YAML Frontmatter
</code></pre>
<p>앞에 <code>_</code> 언더바가 붙은 폴더들은 Jekyll이 감지해서 build할 때 사용하는 폴더들이므로 규칙에 맞게 사용해야한다. 모두 안의 내용들을 건드릴 수 있지만 <code>_site</code> 폴더는 자동으로 생성되는 것이므로 건드려봤자 소용이 없다.(수정해봤자 다음 빌드 때 원상복귀된다)</p>
<blockquote>
<p><code>jekyll build --source &lt;source&gt; --destination &lt;destination&gt; --watch</code> 명령어로 옵션을 줘서 어떤 디렉토리를 이용할건지, 최종 생성될 폴더는 어디인지를 직접 지정할 수 있다. 디폴트는 각각 현재 디렉토리, 그리고 _site 폴더다. <code>--watch</code> 옵션은 파일 감지해서 자동 생성 가능하게 한다.</p>
</blockquote>
<h3><a id="user-content-31-_includes" class="anchor" aria-hidden="true" href="#31-_includes"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>3.1 _includes</h3>
<ul>
<li>
<p>코드 재사용을 위한 <code>template partials</code>가 위치하는 곳이다.</p>
</li>
<li>
<p>한 웹사이트에서 footer, header 같은 것들은 어떤 페이지를 들어가도 같다. 그래서 하나의 파일을 만들어두고, 이 파일을 가져다가 쓴다.</p>
</li>
<li>
<p>수정할 때 모든 페이지, 모든 포스트에 가서 header를 하나하나 수정할 필요없이 내 header 파일만 수정하면 되므로 수정에 매우 용이하다.</p>
</li>
<li>
<p>확장자는 필요한 어떤 확장자도 가능하고, header 내용이 필요한 다른 파일에서 아래처럼 가져와서 사용한다. 아래는 html 파일에서 html partial을 가져와 쓰는 예다.</p>
<pre><code>...
{% include header.html %}
...
</code></pre>
</li>
</ul>
<h3><a id="user-content-32-_layouts" class="anchor" aria-hidden="true" href="#32-_layouts"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>3.2 _layouts</h3>
<ul>
<li>내 사이트에서 필요로하는 모든 템플릿 html 파일들이 위치한다.
<ul>
<li>대표적으로 글마다 반복적으로 활용되는 <code>post.html</code></li>
<li>사이트 혹은 내 소개 내용을 담는 <code>about.html</code></li>
<li>내 연락처를 담는 <code>contact.html</code></li>
</ul>
</li>
<li>내 사이트에서 어떤 페이지를 만들고싶다면 무조건 여기에 파일이 있어야한다고 생각하자.</li>
<li>이 템플릿을 이용해서 다양한 글들이 만들어지고, 각 글의 제목 혹은 permalink에 따라 위치한 path가 달라지므로 css나 js를 불러올 때는 꼭 absolute path를 쓰는게 좋다.</li>
<li>인터넷에 공개되어있는 좋은 theme을 보면 잘 만들어둔 html 파일들이 있을 것이다. 그런것들을 <code>_layouts</code> 폴더에 넣으면 된다.</li>
</ul>
<h3><a id="user-content-33-_posts" class="anchor" aria-hidden="true" href="#33-_posts"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>3.3 _posts</h3>
<ul>
<li>Front matter 내용이 추가된 마크다운 형식의 <strong>글</strong>들이 위치하는 디렉토리다.</li>
<li><strong>무조건</strong> 다음 포맷 <code>YEAR-MONTH-DAY-title.MARKUP</code> 으로 파일명을 지정해줘야한다.</li>
<li>따로 permalink를 지정하지 않으면 저 파일명대로 디렉토리가 나눠져서 최종 내 글(html) 파일이 위치하게 된다.</li>
</ul>
<h3><a id="user-content-34-_site" class="anchor" aria-hidden="true" href="#34-_site"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>3.4 _site</h3>
<ul>
<li>따로 destination 디렉토리를 지정하지 않으면 디폴트로 <code>_site</code>에 모든 최종 파일들이 생성되게 된다.</li>
<li>건드려서도, 건드릴 필요도 없는 디렉토리다.</li>
<li>어차피 GitHub에 올리면 따로 생성되기 때문에 <code>.gitignore</code> 파일에 이 디렉토리를 추가해주는 것이 좋다.</li>
</ul>
<h3><a id="user-content-35-_data" class="anchor" aria-hidden="true" href="#35-_data"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>3.5 _data</h3>
<ul>
<li>사이트에서 활용할 정형화된 데이터 파일들이 위치한다. <code>.yml</code>, <code>.yaml</code>, <code>.json</code>, <code>.csv</code> 파일들이 위치함</li>
<li><code>site.data</code> 로 어떤 파일에서든 호출해서 사용할 수 있다.</li>
<li>만약 <code>members.yml</code> 파일이라면 <code>site.data.members</code>로 호출해서 사용 가능</li>
</ul>
<h3><a id="user-content-36-_drafts-_sass" class="anchor" aria-hidden="true" href="#36-_drafts-_sass"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>3.6 _drafts, _sass</h3>
<ul>
<li><code>_drafts</code> : 발행하지 않은 글 파일들은 단순히 <code>title.markup</code> 형태로 여기다 넣어두면 된다.</li>
<li><code>_sass</code> : sass partials들이 위치한다.
<ul>
<li>main.scss 파일에서 호출해서 쓸 수 있다. ex) <code>@import "base";</code> <code>@import "layout"</code></li>
<li>main.scss는 build될 때 main.css로 알아서 jekyll이 만들어준다.</li>
</ul>
</li>
<li><code>feed.xml</code>: rss feed를 생성한다.</li>
</ul>
<h3><a id="user-content-37-기타" class="anchor" aria-hidden="true" href="#37-기타"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>3.7 기타</h3>
<ul>
<li>앞에 <code>_</code>가 붙지 않은 폴더들(css, images, js 등)과 일반 파일들은 Jekyll이 건드리지 않고 그대로 <code>_site</code> 폴더로 보내진다.</li>
<li><code>favicon.ico</code>은 마음에 드는거 골라서 root 디렉토리에 넣어둔다.</li>
<li><code>_config.yml</code> 파일은 아래에서 자세히 설명. 그리고 이 파일은 <code>--watch</code> 옵션이 설정되어있더라도 로컬서버 실행 중엔 변경 사항이 적용되지 않는다. 재시작해야함.</li>
</ul>
<h2><a id="user-content-4-_configyml" class="anchor" aria-hidden="true" href="#4-_configyml"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>4. _config.yml</h2>
<p>한 마디로 말해서 변수값들의 집합이다. Jekyll이 빌드할 때 사용하는 지정된 변수, 즉 <strong>Global configuration</strong>과 사용자가 어디서든 편하게 사용할 <strong>임의의</strong> 변수들도 있다. 지정한 변수들은 <code>{{ site.var_name }}</code>으로 어디서든 호출해서 사용할 수 있다.</p>
<p><a href="https://jekyllrb.com/docs/configuration/" rel="nofollow">공식문서 configurations</a>에 엄청나게 많다. 대표적인 것만 추린다.</p>
<ul>
<li><code>source: DIR</code> : 디폴트는 현재 디렉토리 <code>./</code>이고, 지정된 DIR path가 소스가 된다. 웹사이트에 대한 내용이 아니라 다른 코드도 해당 repository에 존재한다면 이렇게 구분하는 것도 좋은 방법이다.</li>
<li><code>destination: DIR</code> : 디폴트는 <code>./_site</code> 이고, 지정해서 다른 폴더로 만들 수 있다.</li>
<li><code>safe: BOOL</code> : 플러그인이나 symbolic link들이 실행되지 않도록 한다.</li>
<li><code>exclude: [DIR, FILE, ...]</code> : 빌드할 때 웹사이트와 관계없어서 제외할 파일들 명시</li>
<li><code>keep_files: [DIR, FILE, ...]</code> : Jekyll이 빌드하지 않는, 다른 빌드 툴이 생성하는 파일들을 destination dir에 포함하고 싶을 때 사용한다.</li>
<li><code>timezone: TIMEZONE</code> : <code>America/New_York</code> 혹은 <code>Asia/Seoul</code> 로 세팅</li>
<li><code>encoding: utf-8</code> : encoding 설정. utf-8이 디폴트값이다.</li>
<li><code>port: PORT</code> : 로컬 서버에서 포트 설정</li>
<li><code>baseurl: "/blog"</code> : 사이트의 기본 subpath 지정한다. index.html 파일이 표현되는 URI가 <code>domain/blog</code> 형태로 된다.</li>
<li><code>url: ""</code> : hostname과 protocol까지 지정할 수 있다. 만약 내 고유 도메인을 이용하고 싶으면 지정해준다. ex) <a href="http://example.com" rel="nofollow">http://example.com</a></li>
<li><code>markdown: kramdown</code> : 이게 기본이고 굳이 바꾸지말자.</li>
</ul>
<h2><a id="user-content-5-front-matter" class="anchor" aria-hidden="true" href="#5-front-matter"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>5. Front matter</h2>
<div class="highlight highlight-source-yaml"><pre>---
<span class="pl-ent">layout</span>: <span class="pl-s">post</span>
<span class="pl-ent">permalink</span>: <span class="pl-s">about-jekyll</span>
<span class="pl-ent">title</span>: <span class="pl-s">Blogging Like a Hacker</span>
<span class="pl-ent">date</span>: <span class="pl-s">2017-11-19 18:00:00 -0900</span>
<span class="pl-ent">categories</span>: <span class="pl-s">ml optimizer</span>
---</pre></div>
<p>어떤 파일이든 YAML 형식의 block을 포함하고 있으면 jekyll이 다른 파일로 변환시킨다.(md 파일 뿐만 아니라 html 역시) 파일의 맨 처음 위치해야하고 dash 3개로 위처럼 구분되어야한다.</p>
<ul>
<li><code>layout</code> : 어떤 템플릿을 사용할건지 지정. 위 예는 <code>_layouts/post.html</code> 이라는 파일을 사용하고 있다.</li>
<li><code>permalink</code> : 디폴트는 날짜와 title로 이루어진 URI인데, 위처럼 지정하면 <code>gyubin.github.io/about-jekyll</code>로 브라우저에서 접근할 수 있다. html 파일의 위치도 URI 구조처럼 root 디렉토리로 된다. permalink를 지정하면 categories와 date로 결정되던 파일 위치는 무시된다.</li>
<li><code>published</code> : True, False로 설정해서 글로 안보여지게 할 수도 있다.</li>
<li><code>date: YYYY-MM-DD HH:MM:SS +/-TTTT</code> 꼴로 쓰고 연월일 뒤는 생략가능하다. 파일명에 있는 날짜 정보를 오버라이드한다.</li>
<li><code>categories: ml optimizer</code> : 공백으로 구분해서 카테고리 위계를 설정할 수 있다. 빌드하면 디렉토리가 ml 폴더 안에 optimizer 폴더 안에 날짜로 구분되어 html파일들이 생긴다.</li>
<li><code>tags: aa bb cc dd</code> : 공백 구분해서 여러 태그를 설정해줄 수 있다.</li>
<li><code>comments: true</code> : disqus로 댓글 설정할 때 꼭 이렇게 지정해줘야한다.</li>
</ul>
<p>이렇게 설정된 변수들은 <code>{{ page.title }}</code> 형태로 템플릿에서 사용한다.</p>
<h2><a id="user-content-6-liquid-문법" class="anchor" aria-hidden="true" href="#6-liquid-문법"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>6. Liquid 문법</h2>
<ul>
<li><code>{{ }}</code> : Output markup. 안에 쓴 객체가 html에 그대로 출력된다. <code>{{ page.title }}</code> 이라면 저 객체가 갖고 있는 값이 그대로 html에서 보여진다. 변수 정보는 다음 <a href="http://jekyllrb.com/docs/variables/" rel="nofollow">링크</a>에 나와있다.</li>
<li><code>{% %}</code> : Tag markup. 안에 쓴 내용이 html에 보이지 않는다. 반복 시작과 끝, 조건 시작과 끝을 나타낸다.</li>
<li>filter: <code>&lt;p&gt;Posted {{ post.date | date: "%b %-d, %Y" }}&lt;/p&gt;</code> 처럼 쓴다. <a href="https://github.com/Shopify/liquid/wiki/Liquid-for-Designers#standard-filters">GitHub</a>, <a href="http://jekyllrb.com/docs/templates/" rel="nofollow">공식문서</a> 참조.</li>
</ul>
<h2><a id="user-content-7-disqus" class="anchor" aria-hidden="true" href="#7-disqus"><svg class="octicon octicon-link" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M4 9h1v1H4c-1.5 0-3-1.69-3-3.5S2.55 3 4 3h4c1.45 0 3 1.69 3 3.5 0 1.41-.91 2.72-2 3.25V8.59c.58-.45 1-1.27 1-2.09C10 5.22 8.98 4 8 4H4c-.98 0-2 1.22-2 2.5S3 9 4 9zm9-3h-1v1h1c1 0 2 1.22 2 2.5S13.98 12 13 12H9c-.98 0-2-1.22-2-2.5 0-.83.42-1.64 1-2.09V6.25c-1.09.53-2 1.84-2 3.25C6 11.31 7.55 13 9 13h4c1.45 0 3-1.69 3-3.5S14.5 6 13 6z"></path></svg></a>7. Disqus</h2>
<ul>
<li>
<p><a href="https://disqus.com/" rel="nofollow">Disqus 사이트</a>로 들어가서 회원가입하고, "site"를 하나 만든다.</p>
</li>
<li>
<p>만드는 과정 중 아래와 비슷한 코드를 줄 것이다. 복사해서 <code>_layouts</code> 폴더에 "글"을 나타내는 템플릿에 붙여넣는다.</p>
<div class="highlight highlight-text-html-basic"><pre>{% if page.comments %}
  &lt;<span class="pl-ent">div</span> <span class="pl-e">id</span>=<span class="pl-s"><span class="pl-pds">"</span>disqus_thread<span class="pl-pds">"</span></span>&gt;&lt;/<span class="pl-ent">div</span>&gt;
  &lt;<span class="pl-ent">script</span>&gt;<span class="pl-s1"></span>
<span class="pl-s1">    <span class="pl-k">var</span> <span class="pl-en">disqus_config</span> <span class="pl-k">=</span> <span class="pl-k">function</span> () {</span>
<span class="pl-s1">      <span class="pl-c1">this</span>.<span class="pl-smi">page</span>.<span class="pl-smi">url</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">"</span>https://gyubin.github.io<span class="pl-pds">"</span></span> <span class="pl-k">+</span> <span class="pl-s"><span class="pl-pds">"</span>{{ page.url }}<span class="pl-pds">"</span></span>;</span>
<span class="pl-s1">      <span class="pl-c1">this</span>.<span class="pl-smi">page</span>.<span class="pl-smi">identifier</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">"</span>{{ page.url }}<span class="pl-pds">"</span></span>;</span>
<span class="pl-s1">    };</span>
<span class="pl-s1">    (<span class="pl-k">function</span>() { <span class="pl-c"><span class="pl-c">//</span> DON'T EDIT BELOW THIS LINE</span></span>
<span class="pl-s1">    <span class="pl-k">var</span> d <span class="pl-k">=</span> <span class="pl-c1">document</span>, s <span class="pl-k">=</span> <span class="pl-smi">d</span>.<span class="pl-c1">createElement</span>(<span class="pl-s"><span class="pl-pds">'</span>script<span class="pl-pds">'</span></span>);</span>
<span class="pl-s1">    <span class="pl-smi">s</span>.<span class="pl-smi">src</span> <span class="pl-k">=</span> <span class="pl-s"><span class="pl-pds">'</span>https://gyubin.disqus.com/embed.js<span class="pl-pds">'</span></span>;</span>
<span class="pl-s1">    <span class="pl-smi">s</span>.<span class="pl-c1">setAttribute</span>(<span class="pl-s"><span class="pl-pds">'</span>data-timestamp<span class="pl-pds">'</span></span>, <span class="pl-k">+</span><span class="pl-k">new</span> <span class="pl-en">Date</span>());</span>
<span class="pl-s1">    (<span class="pl-smi">d</span>.<span class="pl-smi">head</span> <span class="pl-k">||</span> <span class="pl-smi">d</span>.<span class="pl-c1">body</span>).<span class="pl-c1">appendChild</span>(s);</span>
<span class="pl-s1">    })();</span>
<span class="pl-s1">  </span><span class="pl-s1">&lt;</span>/<span class="pl-ent">script</span>&gt;
  &lt;<span class="pl-ent">noscript</span>&gt;
    Please enable JavaScript to view the &lt;<span class="pl-ent">a</span> <span class="pl-e">href</span>=<span class="pl-s"><span class="pl-pds">"</span>https://disqus.com/?ref_noscript<span class="pl-pds">"</span></span>&gt;comments powered by Disqus.&lt;/<span class="pl-ent">a</span>&gt;
  &lt;/<span class="pl-ent">noscript</span>&gt;
{% endif %}</pre></div>
</li>
<li>
<p>다음 두 변수 정도만 수정해주면 된다.</p>
<ul>
<li><code>this.page.url</code> : 해당 페이지(글)의 url을 지정해준다.</li>
<li><code>this.page.identifier</code> : 페이지만의 유니크한 값을 지정해준다. 나는 domain 뒷부분 문자열을 사용했다.</li>
</ul>
</li>
<li>
<p>위처럼 <code>url</code>과 <code>identifier</code>를 설정해줘야 블로그의 글 마다 댓글을 다르게 띄울 수 있고 꼭 다른 값으로 설정하자. 같은 값으로 설정하면 conflict가 난다.</p>
</li>
<li>
<p>글 내용 파일의 Front Matter에서 <code>comments: true</code>로 주는 것 잊지말자.</p>
</li>
</ul>
