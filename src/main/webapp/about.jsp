<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>BrightStart | About</title><link rel="stylesheet" href="style.css"></head>
<body>
  <header class="site-header"><a class="brand" href="index.jsp">BrightStart<span>.</span></a><nav aria-label="Main navigation"><a href="index.jsp">Home</a><a href="about.jsp" aria-current="page">About</a><a href="contact.jsp">Contact</a></nav></header>
  <main>
    <section class="page-heading"><p class="eyebrow">A LITTLE ABOUT US</p><h1>Every great thing<br>starts somewhere.</h1><p class="intro">BrightStart is a fictional creative studio built around one simple idea: getting online should feel approachable.</p></section>
    <section class="story"><div><p class="eyebrow">OUR STORY</p><h2>Small team.<br>Thoughtful work.</h2></div><div><p>We believe a useful website begins with a clear story. Who are you? What do you offer? How can people reach you?</p><p>Our approach brings those answers together in a friendly, easy-to-use experience. This demo shows how three simple pages can become the foundation of a business website.</p><a class="text-link" href="contact.jsp">Say hello &#8594;</a></div></section>
    <section class="services"><p class="eyebrow">WHAT MATTERS TO US</p><div class="grid"><article class="card"><span class="number">01</span><h3>Clarity</h3><p>Clear words and purposeful design make every visit easier.</p></article><article class="card"><span class="number">02</span><h3>Care</h3><p>Small details help people feel welcome from the first click.</p></article><article class="card"><span class="number">03</span><h3>Progress</h3><p>Start with what you need today, then grow at your own pace.</p></article></div></section>
  </main>
  <footer><span>BrightStart &copy; <%= java.time.Year.now() %> &middot; A demo business website</span><a href="contact.jsp">Let's build something &#8599;</a></footer>
</body>
</html>
