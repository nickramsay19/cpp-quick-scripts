#include <iostream>
#include <vector>
#include <string>
#include <string_view>
#include <toml.hpp>

int main() {
    
    toml::table table = toml::parse_file("tasks.toml");

    // convert scripts node to a toml::table
    const toml::node_view scripts_node_view = table["scripts"];
    const toml::table* scripts = scripts_node_view.as_table();

    // loop over each script config
    for (auto&& [key, val] : *scripts) {
        const std::string_view script_name = key;
        const toml::node& script_config = val;
        std::cout << script_name << " : "\n";

        
    }
    

    return 0;
}
