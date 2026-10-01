<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="Explore BrightStart Pricing - a creative studio demo."><title>BrightStart | Pricing</title><link rel="stylesheet" href="style.css"><link rel="stylesheet" href="pages.css"></head>
<body>
<% request.setAttribute("activePage", "pricing"); %>
<%@ include file="WEB-INF/fragments/header.jspf" %>
<main id="main-content" class="container extra-pages">
<section class="page-heading"><p class="eyebrow">A PLACE TO START</p><h1>Clear scope.<br><em>Thoughtful</em> options.</h1><p class="intro">Illustrative packages to help you plan. All prices are demo amounts in Indian rupees, not live offers or quotes.</p></section>
<section class="services"><div class="grid pricing-grid">
<article class="card price-card"><p class="eyebrow">STARTER</p><h2>A first hello.</h2><p class="price">&#8377;15,000<span>example project price</span></p><p>For a focused online introduction.</p><ul><li>Up to 3 content pages</li><li>Responsive page layouts</li><li>Email contact link</li><li>One design review round</li><li>Basic handover notes</li></ul><a class="button" href="contact.jsp#contact-form">Discuss Starter &#8599;</a></article>
<article class="card price-card featured"><span class="badge">MORE ROOM TO GROW</span><p class="eyebrow">GROWTH</p><h2>A fuller story.</h2><p class="price">&#8377;30,000<span>example project price</span></p><p>For more services, stories, and work to share.</p><ul><li>Up to 7 content pages</li><li>Responsive page layouts</li><li>Portfolio and FAQ sections</li><li>Two design review rounds</li><li>Build and deployment guide</li></ul><a class="button" href="contact.jsp#contact-form">Discuss Growth &#8599;</a></article>
<article class="card price-card"><p class="eyebrow">CUSTOM</p><h2>Your next chapter.</h2><p class="price">Let's talk<span>scope agreed together</span></p><p>For extra features or a different structure.</p><ul><li>Discovery and scope planning</li><li>Custom page requirements</li><li>Integration assessment</li><li>Agreed review milestones</li><li>Tailored handover plan</li></ul><a class="button" href="contact.jsp#contact-form">Discuss Custom &#8599;</a></article>
</div></section>
<section class="story"><div><p class="eyebrow">PLAN WITH CONFIDENCE</p><h2>Know what goes<br>into your project.</h2></div><div><p>Example packages cover design and development only. Domain registration, hosting, paid assets, maintenance, taxes, and third-party subscriptions are excluded.</p><p>Content readiness, feedback, and custom features affect timing. A real project needs an agreed written scope and confirmed quote before work begins.</p><a class="text-link" href="faq.jsp">Read common questions &#8594;</a></div></section>
</main>
<%@ include file="WEB-INF/fragments/footer.jspf" %>
</body>
</html>
