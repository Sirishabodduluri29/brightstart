package com.brightstart;

import org.junit.Test;
import static org.junit.Assert.*;

public class HtmlTest {
    @Test
    public void escapesMarkupAndAttributeDelimiters() {
        assertEquals("&lt;script&gt;&quot;Hello&quot; &amp; &#39;bye&#39;&lt;/script&gt;",
                Html.escape("<script>\"Hello\" & 'bye'</script>"));
    }

    @Test
    public void preservesPlainTextAndHandlesNull() {
        assertEquals("Sirisha", Html.escape("Sirisha"));
        assertEquals("", Html.escape(null));
    }
}
