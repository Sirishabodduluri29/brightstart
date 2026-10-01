package com.brightstart;

import org.junit.Test;
import static org.junit.Assert.*;

public class ContactFormTest {
    private static final String MESSAGE = "I would like a website for my small business.";

    @Test
    public void acceptsValidDetailsAndTrimsWhitespace() {
        ContactForm form = new ContactForm("  Sirisha  ", " hello@example.com ", "Website design", " " + MESSAGE + " ");
        assertTrue(form.validate().isEmpty());
        assertEquals("Sirisha", form.getName());
        assertEquals("hello@example.com", form.getEmail());
        assertEquals(MESSAGE, form.getMessage());
    }

    @Test
    public void missingFieldsProduceErrorsRatherThanThrowing() {
        assertEquals(4, new ContactForm(null, null, null, null).validate().size());
    }

    @Test
    public void rejectsMalformedEmailAddresses() {
        for (String email : new String[]{"hello", "hello@", "@example.com", "hello@example", "hello world@example.com", "a@@example.com"}) {
            assertTrue(email, new ContactForm("Sirisha", email, "Website design", MESSAGE).validate().containsKey("email"));
        }
    }

    @Test
    public void rejectsOversizedFieldsAndUnknownServices() {
        ContactForm form = new ContactForm("a".repeat(81), "a".repeat(250) + "@example.com", "Unexpected option", "a".repeat(2001));
        assertEquals(4, form.validate().size());
    }

    @Test
    public void messageBoundariesAreInclusive() {
        assertTrue(new ContactForm("Si", "s@example.com", "Something else", "a".repeat(20)).validate().isEmpty());
        assertTrue(new ContactForm("a".repeat(80), "s@example.com", "Website refresh", "a".repeat(2000)).validate().isEmpty());
        assertTrue(new ContactForm("Si", "s@example.com", "Brand identity", "a".repeat(19)).validate().containsKey("message"));
    }
}
