<%= javascript_pack_tag 'pb_heading' %>
<%= pb_react('Heading', props: {show_props: defined?(@kit)}) %>

<%=
if(defined?(@kit))
  render 'config/ui/propsTableSimple',
    component_props: {
        text: "Heading 4",
        tag: "div",
        size: "4",
        show_props: defined?(@kit) }
end %>