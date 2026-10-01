<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="Explore BrightStart Services - a creative studio demo."><title>BrightStart | Services</title><link rel="stylesheet" href="style.css"><link rel="stylesheet" href="pages.css"></head>
<body>
<% request.setAttribute("activePage", "services"); %>
<%@ include file="WEB-INF/fragments/header.jspf" %>
<main id="main-content" class="container extra-pages">
<section class="page-heading"><p class="eyebrow">WHAT WE CAN CREATE</p><h1>Useful by design.<br><em>Beautiful</em> by nature.</h1><p class="intro">From a first website to a fresh digital identity, our example services help small businesses take their next step.</p></section>
<section class="services"><div class="grid">
<article class="card"><span class="number">01 / WEB DESIGN</span><h3>Your story, clearly told.</h3><p>A visual direction shaped around your audience.</p><ul><li>Page layouts and navigation</li><li>Color and typography direction</li><li>Mobile layout planning</li></ul></article>
<article class="card"><span class="number">02 / DEVELOPMENT</span><h3>Bring the idea to life.</h3><p>Turn approved designs into a responsive website.</p><ul><li>Responsive page development</li><li>Reusable navigation and footer</li><li>Build and deployment guidance</li></ul></article>
<article class="card"><span class="number">03 / BRAND FOUNDATION</span><h3>A consistent impression.</h3><p>A starting point for how your business looks and speaks.</p><ul><li>Visual mood and direction</li><li>Brand color palette</li><li>Simple usage guidance</li></ul></article>
<article class="card"><span class="number">04 / CONTENT</span><h3>Find the right words.</h3><p>Organize your story so visitors understand what you offer.</p><ul><li>Content outlines</li><li>Headings and calls to action</li><li>Service page structure</li></ul></article>
<article class="card"><span class="number">05 / WEBSITE REFRESH</span><h3>A fresh chapter.</h3><p>Improve an existing site with a more consistent experience.</p><ul><li>Navigation review</li><li>Layout improvements</li><li>Mobile usability review</li></ul></article>
<article class="card"><span class="number">06 / HANDOVER</span><h3>Keep moving confidently.</h3><p>Understand your website and how to maintain it.</p><ul><li>Project walkthrough</li><li>Build and deployment notes</li><li>Future improvement roadmap</li></ul></article>
</div></section>
<section class="story"><div><p class="eyebrow">HOW IT WORKS</p><h2>A clear path<br>from idea to launch.</h2></div><div><ol class="process"><li><strong>Discover.</strong> Understand your audience, goals, and existing content.</li><li><strong>Design.</strong> Explore layouts and agree on the visual direction.</li><li><strong>Develop.</strong> Build pages and refine them with your feedback.</li><li><strong>Deliver.</strong> Review the experience and prepare the handover.</li></ol><a class="text-link" href="pricing.jsp">Explore example packages &#8594;</a></div></section>
<section class="cta"><h2>Start with what you need today.</h2><a class="button" href="contact.jsp">Tell us your idea &#8599;</a></section>
</main>
<%@ include file="WEB-INF/fragments/footer.jspf" %>
</body>
</html>
