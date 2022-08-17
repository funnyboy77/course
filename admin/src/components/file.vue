<template>
  <div>
    <button type="button" v-on:click="selectFile()" class="btn btn-white btn-default btn-round">
      <i class="ace-icon fa fa-upload"></i>
      {{text}}
    </button>
    <input class="hidden" type="file" ref="file" v-on:change="uploadFile()" v-bind:id="inputId+'-input'">
  </div>
</template>

<script>
  export default {
    name: 'file',
    props: {
      text: {
        default: "上传文件"
      },
      inputId: {
        default: "file-upload"
      },
      suffixs: {
        default: []
      },
      afterUpload: {
        type: Function,
        default: null
      },
    },
    data: function () {
      return {
      }
    },
    methods: {
      uploadFile() {
        let _this = this;
        let formData = new window.FormData();
        let file = _this.$refs.file.files[0];

        //判断文件格式
        let suffixs = _this.suffixs;
        let fileName = file.name;
        let suffix = fileName.substring(fileName.lastIndexOf(".") + 1,fileName.length).toLowerCase();
        let validateSuffix = false;
        for (let i = 0;i<suffixs.length;i++) {
          if (suffixs[i].toLowerCase()===suffix){
            validateSuffix = true;
            break;
          }
        }
        if (!validateSuffix) {
          Toast.warning("文件格式不正确！只支持上传："+suffixs.join(","));
          return;
        }

        //key:"file"必须和后端controller参数名一致
        formData.append('file',file);
        Loading.show();
        _this.$ajax.post(process.env.VUE_APP_SERVER + '/file/admin/upload',formData).then((response)=>{
          Loading.hide();
          let resp = response.data;
          console.log("上传文件成功",resp);
          _this.afterUpload(resp);
        });
      },

      selectFile() {
        let _this = this;
        $("#" + _this.inputId + "-input").trigger("click");
      }

    }
  }
</script>

<style scoped>
  .pagination {
    vertical-align: middle !important;
    font-size: 16px;
    margin-top: 0;
    margin-bottom: 10px;
  }

  .pagination button {
    margin-right: 5px;
  }

  .btn-primary.active {
    background-color: #2f7bba !important;
    border-color: #27689d !important;
    color: white !important;
    font-weight: 600;
  }

  /*.pagination select {*/
  /*vertical-align: middle !important;*/
  /*font-size: 16px;*/
  /*margin-top: 0;*/
  /*}*/
</style>
