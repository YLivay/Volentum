///template_destroy(id)
/*
 * Destroys a template.
 *
 * Arguments:
 *   id - the template ID.
 */
{
    _template_init();
    
    var data = provider_instance_destroy("template", argument0);
    
    // Free the actual data.
    if (is_real(data) && ds_exists(data, ds_type_map))
    {
        // TODO: clear resources here
        
        ds_map_clear(data);
        ds_map_destroy(data);
    }
}

