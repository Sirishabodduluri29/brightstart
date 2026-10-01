package com.brightstart;

import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Set;
import java.util.regex.Pattern;

/** Keeps contact validation separate from the servlet and the page. */
public final class ContactForm {
    private static final Set<String> SERVICES = Set.of("Website design", "Brand identity", "Website refresh", "Something else");
    private static final Pattern EMAIL = Pattern.compile("^[^\\s@]+@[^\\s@]+\\.[^\\s@]+$");
    private final String name;
    private final String email;
    private final String service;
    private final String message;

    public ContactForm(String name, String email, String service, String message) {
        this.name = clean(name);
        this.email = clean(email);
        this.service = clean(service);
        this.message = clean(message);
    }

    private static String clean(String value) {
        return value == null ? "" : value.strip();
    }

    public Map<String, String> validate() {
        Map<String, String> errors = new LinkedHashMap<>();
        if (name.length() < 2 || name.length() > 80) {
            errors.put("name", "Enter your name using 2 to 80 characters.");
        }
        if (email.length() > 254 || !EMAIL.matcher(email).matches()) {
            errors.put("email", "Enter a valid email address.");
        }
        if (!SERVICES.contains(service)) {
            errors.put("service", "Choose a service from the list.");
        }
        if (message.length() < 20 || message.length() > 2000) {
            errors.put("message", "Tell us about your idea using 20 to 2,000 characters.");
        }
        return errors;
    }

    public String getName() { return name; }
    public String getEmail() { return email; }
    public String getService() { return service; }
    public String getMessage() { return message; }
}
