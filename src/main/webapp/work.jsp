<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="Explore BrightStart Work - a creative studio demo."><title>BrightStart | Work</title><link rel="stylesheet" href="style.css"><link rel="stylesheet" href="pages.css"></head>
<body>
<% request.setAttribute("activePage", "work"); %>
<%@ include file="WEB-INF/fragments/header.jspf" %>
<main id="main-content" class="container extra-pages">
<section class="page-heading"><p class="eyebrow">SELECTED CONCEPTS</p><h1>A little inspiration.<br>A lot of <em>possibility.</em></h1><p class="intro">Six fictional projects exploring different directions for small business websites. These are portfolio concepts, not client work.</p></section>
<section class="services"><div class="filters" role="group" aria-label="Filter projects"><button type="button" data-filter="all" aria-pressed="true">All projects</button><button type="button" data-filter="website" aria-pressed="false">Websites</button><button type="button" data-filter="brand" aria-pressed="false">Brand concepts</button></div><p id="work-status" class="note" aria-live="polite">Showing 6 projects</p><div class="grid work-grid">
<article class="card project" data-category="website"><div class="project-art mint" aria-hidden="true"><span>leaf &amp; root<small>GROW SOMETHING GOOD</small></span></div><p class="eyebrow">WEBSITE / CONCEPT</p><h3>Leaf &amp; Root</h3><p>A calm home for a plant shop, with care guides, collection introductions, and store information.</p><span class="tag">Retail</span></article>
<article class="card project" data-category="website"><div class="project-art peach" aria-hidden="true"><span>little oven.<small>BAKED WITH LOVE</small></span></div><p class="eyebrow">WEBSITE / CONCEPT</p><h3>Little Oven</h3><p>A welcoming bakery website with a seasonal menu, the founder's story, and an enquiry route.</p><span class="tag">Food &amp; drink</span></article>
<article class="card project" data-category="brand"><div class="project-art lilac" aria-hidden="true"><span>FORM<small>SPACE TO THINK</small></span></div><p class="eyebrow">BRAND / CONCEPT</p><h3>Form Studio</h3><p>A quiet visual identity for an interior design practice, with soft color and confident typography.</p><span class="tag">Design</span></article>
<article class="card project" data-category="website"><div class="project-art yellow" aria-hidden="true"><span>next chapter<small>FIND YOUR NEXT FAVORITE</small></span></div><p class="eyebrow">WEBSITE / CONCEPT</p><h3>Next Chapter</h3><p>A neighborhood bookshop concept with reading recommendations and community event information.</p><span class="tag">Community</span></article>
<article class="card project" data-category="brand"><div class="project-art blue" aria-hidden="true"><span>slow days<small>A MOMENT FOR YOURSELF</small></span></div><p class="eyebrow">BRAND / CONCEPT</p><h3>Slow Days</h3><p>A gentle brand direction for a wellness studio, built around space, balance, and simple shapes.</p><span class="tag">Wellness</span></article>
<article class="card project" data-category="website"><div class="project-art rose" aria-hidden="true"><span>clay house<small>MADE BY HAND</small></span></div><p class="eyebrow">WEBSITE / CONCEPT</p><h3>Clay House</h3><p>A ceramics workshop website with class details, artist introductions, and helpful visitor information.</p><span class="tag">Art &amp; craft</span></article>
</div></section><section class="cta"><h2>Your story could inspire the next direction.</h2><a class="button" href="contact.jsp">Share your idea &#8599;</a></section>
</main>
<%@ include file="WEB-INF/fragments/footer.jspf" %>
</body>
</html>
