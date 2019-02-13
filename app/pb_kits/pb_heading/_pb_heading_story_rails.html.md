<%= pb_rails("pb_heading", props: { text: "Heading 1", tag: "div", size: "1", :show_props => defined?(@kit) }) %>
<%= pb_rails("pb_heading", props: { text: "Heading 2", tag: "div", size: "2", :show_props => defined?(@kit) }) %>
<%= pb_rails("pb_heading", props: { text: "Heading 3", tag: "div", size: "3", :show_props => defined?(@kit) }) %>
<%= pb_rails("pb_heading", props: { text: "Heading 4", tag: "div", size: "4", :show_props => defined?(@kit) }) %>

<%=
if(defined?(@kit))
  render 'config/ui/propsTableSimple',
    component_props: {
        text: "Heading 4",
        tag: "div",
        size: "4",
        show_props: defined?(@kit) }
end %>