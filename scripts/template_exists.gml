///template_exists(id)
/*
 * Checks if a template exists.
 *
 * Arguments:
 *   id - the template ID.
 *
 * Returns:
 *   true if the template exists, and false otherwise.
 */
{
    _template_init();
    
    return provider_instance_exists("template", argument0);
}

