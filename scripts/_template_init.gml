///_template_init()
/*
 * Initializes the template provider
 * This should only be used internally.
 */
{
    if (is_flagged("template_provider"))
        exit;
    
    flag("template_provider");
    provider_create("template");
}

