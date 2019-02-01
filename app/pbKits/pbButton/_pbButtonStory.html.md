<%= pb_rails(:pbButton, data: { :text => "Click Here!", :wrapperclass => "kit-btn-wrapper", :componentclass => "kit-btn", :show_props => defined?(@kit)}) %>

<%= javascript_pack_tag 'pbButton' %>
<%= pb_react('pbButton', text: "Click Here!", wrapperclass: "kit-btn-wrapper", componentclass: "kit-btn", show_props: defined?(@kit)) %>
