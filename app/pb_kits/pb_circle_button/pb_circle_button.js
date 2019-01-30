// This is javscript code, which uses ERB tags for templating
// All the methods will be invoked and their values will be interpolated

import Vue from 'vue/dist/vue.esm';

import Circle Button from 'views/circle_button';

new Vue({
    el: '#circle_button-view',
    components: {
        'circle_button-view': Circle Button
    }
});
