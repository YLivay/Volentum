///template_create()
/*
 * Creates a new template struct.
 *
 * Returns:
 *   The new template ID.
 */
{
    _template_init();
    
    // Create the actual template data.
    var data = ds_map_create();
    var template = provider_instance_create("template", data);
    
    return template;
}

