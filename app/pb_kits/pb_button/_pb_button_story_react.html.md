
<%= javascript_pack_tag 'pb_button' %>
<%= pb_react('pb_button', props: {text: "React Button", wrapperclass: "kit-btn-wrapper", componentclass: "kit-btn", show_props: defined?(@kit)}) %>

<%=
if(defined?(@kit))
  render 'config/ui/propsTableSimple',
      component_props: {
          text: "Rails Button",
          wrapperclass: "kit-btn-wrapper",
          componentclass: "kit-btn",
          show_props: defined?(@kit) }
end %>
