import Vue from "vue";
import Router from "vue-router"
import Index from "./views/index"
import List from "./views/list"


Vue.use(Router);

export default new Router({
    mode: "history",
    base: process.env.BASE_URL,
    routes: [{
        path: "*",
        redirect: "/index",
    },{
        path: "/index",
        component: Index
    },{
        path: "/list",
        component: List
    }]
})