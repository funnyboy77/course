<template>
  <main role="main">
    <div class="album py-5 bg-light">
      <div class="container">
        <div class="row">
          <div v-for="o in courses" class="col-md-4">
            <the-course v-bind:course="o"></the-course>
          </div>
           <h3 v-show="courses.length === 0">课程还未上架</h3>
        </div>
      </div>
    </div>
  </main>
</template>

<script>
import TheCourse from "@/components/the-course";

export default {
  name: "list",
  components: {TheCourse},
  data: function () {
    return {
      courses: [],
    }
  },
  mounted() {
    let _this = this;
    _this.listCourse();
  },

  methods: {
    /**
     * 查询课程列表
     */
    listCourse(page) {
      let _this = this;
      _this.$ajax.post(process.env.VUE_APP_SERVER + '/business/web/course/list', {
        page: page,
        size: 3,
      }).then((response) => {
        let resp = response.data;
        if (resp.success) {
          _this.courses = resp.content.list;
        }
      }).catch((response) => {
        console.log("error：", response);
      })
    },


  }
}
</script>


<style>

</style>