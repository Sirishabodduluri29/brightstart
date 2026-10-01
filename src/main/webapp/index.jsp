<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>BrightStart | Home</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
  <header class="site-header"><a class="brand" href="index.jsp">BrightStart<span>.</span></a><nav aria-label="Main navigation"><a href="index.jsp" aria-current="page">Home</a><a href="about.jsp">About</a><a href="contact.jsp">Contact</a></nav></header>
  <main>
    <section class="hero"><div><p class="eyebrow">SMALL IDEAS. BIG POSSIBILITIES.</p><h1>A bright beginning<br>for your next idea.</h1><p class="intro">We help small businesses bring their ideas online with thoughtful websites and simple digital experiences.</p><div class="actions"><a class="button" href="contact.jsp">Get in touch <span aria-hidden="true">&#8599;</span></a><a class="text-link" href="about.jsp">Meet BrightStart &#8594;</a></div></div><div class="hero-art" aria-hidden="true"><div class="orb"></div><div class="art-card"><span class="art-label">YOUR NEXT CHAPTER</span><strong>Start small.<br>Build something<br>great.</strong><span class="art-bottom">Made with purpose. &#10038;</span></div></div></section>
    <section class="services"><p class="eyebrow">WHAT WE DO</p><h2>Good things start with the basics.</h2><div class="grid"><article class="card"><span class="number">01</span><h3>Website design</h3><p>Clean, welcoming pages that make your business easy to understand.</p></article><article class="card"><span class="number">02</span><h3>Digital presence</h3><p>A home for your story, your services, and the people you want to reach.</p></article><article class="card"><span class="number">03</span><h3>Simple solutions</h3><p>Practical ideas that help you take the next step with confidence.</p></article></div></section>
  </main>
  <footer><span>BrightStart &copy; <%= java.time.Year.now() %> &middot; A demo business website</span><a href="contact.jsp">Let's build something &#8599;</a></footer>
</body>
</html>
