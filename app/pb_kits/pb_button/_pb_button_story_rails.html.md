## Primary
<%= pb_rails("pb_button", props: { text: "Rails Button", wrapperclass: "kit-btn-wrapper", componentclass: "kit-btn", show_props: defined?(@kit)}) %>


<br/><br/>

## Secondary
<%= pb_rails("pb_button", props: { text: "Rails Button", wrapperclass: "kit-btn-wrapper", componentclass: "kit-btn red", show_props: defined?(@kit)}) %>

<%=
if(defined?(@kit))
  render 'config/ui/propsTableSimple',
      component_props: {
          text: "Rails Button",
          wrapperclass: "kit-btn-wrapper",
          componentclass: "kit-btn",
          show_props: defined?(@kit) }
end %>
