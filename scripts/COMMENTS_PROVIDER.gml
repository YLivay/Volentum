/**

This container has scripts that help define a new data struct.
Much like maps and lists, you can create your very own data structs by using this system.
What it does is manage unique IDs for each datastruct you create.

To define a new datastruct you need an "id provider", so you create it with provider_create.
The function will return a handle used to do all other operations on the created provider like creating,
destroying and getting instances.

Since you can hold whatever type of information in the provider, it's impossible for it to clean up memory
you define, so you're in charge of freeing any resources your instance might used after it's being removed
from the provider.

More information inside the scripts themselves. Refer to Template container for a simple example.

**/

