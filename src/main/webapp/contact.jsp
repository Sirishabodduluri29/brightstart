<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.brightstart.ContactForm,com.brightstart.Html,java.util.Map" %>
<%
    request.setAttribute("activePage", "contact");
    response.setHeader("Cache-Control", "no-store");
    ContactForm form = (ContactForm) request.getAttribute("form");
    if (form == null) { form = new ContactForm("", "", "", ""); }
    Map<String, String> errors = (Map<String, String>) request.getAttribute("errors");
    if (errors == null) { errors = Map.of(); }
    boolean success = Boolean.TRUE.equals(session.getAttribute("contactSuccess"));
    session.removeAttribute("contactSuccess");
%>
<!doctype html><html lang="en">
<head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="Share your next project idea with the BrightStart demo contact form."><title>Let's talk | BrightStart</title><link rel="stylesheet" href="<%= request.getContextPath() %>/style.css"></head>
<body>
<%@ include file="WEB-INF/fragments/header.jspf" %>
<main id="main-content">
  <section class="container page-heading"><p class="eyebrow">EVERY GOOD IDEA STARTS WITH A CONVERSATION</p><h1>A little hello.<br>A <span class="highlight">lot of possibility.</span></h1><p class="intro">Tell us what you're thinking. A new website, a fresh identity, or an idea still taking shape. We'd love to hear it.</p></section>
  <section class="container contact-layout">
    <aside class="contact-aside"><div class="contact-info"><span class="service-icon" aria-hidden="true">&#9993;</span><h2>Let's connect.</h2><p>Prefer an email? Start a conversation in your own words.</p><a class="text-link" href="mailto:hello@example.com">hello@example.com &#8599;</a><p class="small">Placeholder address &middot; Replace before launch</p></div><div class="expect-card"><p class="eyebrow">A GOOD PLACE TO START</p><h3>A few things to think about.</h3><ul><li>What makes your business different?</li><li>What would you like to create?</li><li>Who do you want to reach?</li><li>When would you like to get started?</li></ul></div><p class="aside-note"><span aria-hidden="true">&#10038;</span> No perfect brief needed.<br>Just bring your idea.</p></aside>
    <div class="form-card" id="contact-form">
      <p class="eyebrow">TELL US ABOUT YOUR IDEA</p><h2>Make the first move.</h2><p class="form-intro">A few details will help us understand where you'd like to go.</p>
      <% if (success) { %><div class="notice notice-success" role="status" tabindex="-1" data-form-notice><strong>Your demo request passed validation.</strong><p>Thanks for trying the form! No email was sent and no message was saved.</p></div><% } %>
      <% if (!errors.isEmpty()) { %><div class="notice notice-error" role="alert" tabindex="-1" data-form-notice><strong>Please check your details.</strong><p>Correct the marked fields below and try again.</p></div><% } %>
      <form action="<%= request.getContextPath() %>/contact" method="post" class="contact-form">
        <div class="form-row"><div class="field"><label for="name">Your name <span aria-hidden="true">*</span></label><input id="name" name="name" type="text" autocomplete="name" placeholder="e.g. Sirisha" required minlength="2" maxlength="80" value="<%= Html.escape(form.getName()) %>" aria-invalid="<%= errors.containsKey("name") %>" <%= errors.containsKey("name") ? "aria-describedby=\"name-error\"" : "" %>><% if (errors.containsKey("name")) { %><p class="field-error" id="name-error"><%= Html.escape(errors.get("name")) %></p><% } %></div><div class="field"><label for="email">Email address <span aria-hidden="true">*</span></label><input id="email" name="email" type="email" autocomplete="email" placeholder="you@example.com" required maxlength="254" value="<%= Html.escape(form.getEmail()) %>" aria-invalid="<%= errors.containsKey("email") %>" <%= errors.containsKey("email") ? "aria-describedby=\"email-error\"" : "" %>><% if (errors.containsKey("email")) { %><p class="field-error" id="email-error"><%= Html.escape(errors.get("email")) %></p><% } %></div></div>
        <div class="field"><label for="service">What can we help with? <span aria-hidden="true">*</span></label><select id="service" name="service" required aria-invalid="<%= errors.containsKey("service") %>" <%= errors.containsKey("service") ? "aria-describedby=\"service-error\"" : "" %>><option value="">Choose a service</option><% for (String service : new String[]{"Website design", "Brand identity", "Website refresh", "Something else"}) { %><option value="<%= Html.escape(service) %>" <%= service.equals(form.getService()) ? "selected" : "" %>><%= Html.escape(service) %></option><% } %></select><% if (errors.containsKey("service")) { %><p class="field-error" id="service-error"><%= Html.escape(errors.get("service")) %></p><% } %></div>
        <div class="field"><label for="message">A little about your project <span aria-hidden="true">*</span></label><textarea id="message" name="message" rows="6" placeholder="Your idea, your goals, and anything you'd like us to know..." required minlength="20" maxlength="2000" aria-invalid="<%= errors.containsKey("message") %>" aria-describedby="message-hint<%= errors.containsKey("message") ? " message-error" : "" %>"><%= Html.escape(form.getMessage()) %></textarea><div class="field-hint"><span id="message-hint">20 to 2,000 characters</span><span id="message-count" aria-hidden="true">0 / 2,000</span></div><% if (errors.containsKey("message")) { %><p class="field-error" id="message-error"><%= Html.escape(errors.get("message")) %></p><% } %></div>
        <p class="demo-note">Demo form: your details are validated, then discarded. Nothing is emailed or saved.</p><button class="button submit-button" type="submit">Try the contact form <span aria-hidden="true">&#8599;</span></button>
      </form>
    </div>
  </section>
</main>
<%@ include file="WEB-INF/fragments/footer.jspf" %>
</body></html>
