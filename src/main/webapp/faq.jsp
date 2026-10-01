<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html lang="en">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="Explore BrightStart Faq - a creative studio demo."><title>BrightStart | Faq</title><link rel="stylesheet" href="style.css"><link rel="stylesheet" href="pages.css"></head>
<body>
<% request.setAttribute("activePage", "faq"); %>
<%@ include file="WEB-INF/fragments/header.jspf" %>
<main id="main-content" class="container extra-pages">
<section class="page-heading"><p class="eyebrow">A FEW HELPFUL ANSWERS</p><h1>Good questions.<br><em>Clear</em> answers.</h1><p class="intro">Learn about the example studio process and what this website includes.</p></section>
<section class="faq-section"><label for="faq-search">Find a question</label><input id="faq-search" type="search" placeholder="Try hosting, content, or contact"><p id="faq-status" class="note" aria-live="polite">Showing 8 questions</p>
<details><summary>What kind of websites does BrightStart create?</summary><p>This fictional studio focuses on informational business websites: introductions, services, portfolio concepts, pricing guides, and contact information. This demo shows a seven-page example.</p></details>
<details><summary>How long would a website project take?</summary><p>Timing depends on page count, content readiness, revisions, and custom features. Agree on milestones once scope is clear; these demo packages do not promise a delivery date.</p></details>
<details><summary>Will the website work on mobile devices?</summary><p>Layouts adapt to smaller screens. Navigation can be opened with the Menu button, cards stack vertically, and text sizes adjust to the available space.</p></details>
<details><summary>Who provides the content and images?</summary><p>For a real project, the business supplies approved information and assets it has permission to use. Content planning and writing support can be included in an agreed scope.</p></details>
<details><summary>Are domain registration and hosting included?</summary><p>No. Illustrative prices exclude domains, hosting, subscriptions, and paid assets. Those choices are discussed separately based on the website's needs.</p></details>
<details><summary>Can I update or expand the website later?</summary><p>Yes. The pages use shared navigation and styling. Developers can edit JSP content, rebuild the WAR, and redeploy it. A visual content editor is not included.</p></details>
<details><summary>Does the contact page send messages?</summary><p>The demo form validates your details on the server, then discards them. Nothing is emailed or saved. You can also open your email app using the placeholder email link.</p></details>
<details><summary>Are the portfolio projects and prices real?</summary><p>No. Projects are fictional concepts and prices are illustrative examples to demonstrate a business website.</p></details>
<p id="faq-empty" hidden>No matching questions. Try a shorter keyword or <a class="text-link" href="contact.jsp">visit the contact page</a>.</p></section>
<section class="cta"><h2>Have something else in mind?</h2><a class="button" href="contact.jsp">Start a conversation &#8599;</a></section>
</main>
<%@ include file="WEB-INF/fragments/footer.jspf" %>
</body>
</html>
