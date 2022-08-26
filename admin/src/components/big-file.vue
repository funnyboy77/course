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
    name: 'big-file',
    props: {
      text: {
        default: "上传大文件"
      },
      inputId: {
        default: "file-upload"
      },
      suffixs: {
        default: []
      },
      use: {
        default: ""
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

        let key = hex_md5(file);
        let key10 = parseInt(key,16);
        let key62 = Tool._10to62(key10);
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
        //文件分片
        let shardSize = 10 * 1024 * 1024; //以10MB为一个分片
        let shardIndex = 1; //分片索引 1表示第一个分片
        let size = file.size;
        let shardTotal = Math.ceil(size / shardSize);//总片数

        let param = {
          'shardIndex': shardIndex,
          'shardSize': shardSize,
          'shardTotal': shardTotal,
          'use': _this.use,
          'name': file.name,
          'suffix': suffix,
          'size': file.size,
          'key': key62
        };

        _this.check(param);
      },

      /**
       * 检查文件状态，是否已上传过？传到第几个分片？
       */
      check (param) {
        let _this = this;
        _this.$ajax.get(process.env.VUE_APP_SERVER + '/file/admin/check/' + param.key).then((response)=>{
          let resp = response.data;
          if (resp.success) {
            let obj = resp.content;
            if (!obj) {
              param.shardIndex = 1;
              console.log("没有找到文件记录，从分片1开始上传");
              _this.upload(param);
            } else if (obj.shardIndex === obj.shardTotal) {
              // 已上传分片 = 分片总数，说明已全部上传完，不需要再上传
              Toast.success("文件极速秒传成功！");
              _this.afterUpload(resp);
              $("#" + _this.inputId + "-input").val("");
            } else {
              param.shardIndex = obj.shardIndex + 1;
              console.log("找到文件记录，从分片" + param.shardIndex + "开始上传");
              _this.upload(param);
            }
          } else {
            Toast.warning("文件上传失败");
            $("#" + _this.inputId + "-input").val("");
          }
        })
      },

      upload: function (param) {
        let _this = this;
        let shardIndex = param.shardIndex;
        let shardTotal = param.shardTotal;
        let shardSize = param.shardSize;
        let fileShard = _this.getFileShard(shardIndex, shardSize);
        //将图片转为base64进行传输
        let fileReader = new FileReader();
        fileReader.onload = function (e) {
          let base64 = e.target.result;
          param.shard = base64;
          Loading.show();
          _this.$ajax.post(process.env.VUE_APP_SERVER + '/file/admin/upload', param).then((response) => {
            Loading.hide();
            let resp = response.data;
            console.log("上传文件成功", resp);
            if (shardIndex < shardTotal) {
              //上传下一个分片
              param.shardIndex = param.shardIndex + 1;
              _this.upload(param);
            } else {
              _this.afterUpload(resp);
              $("#" + _this.inputId + "-input").val("");
            }
          });
        };
        fileReader.readAsDataURL(fileShard);
      },

      getFileShard: function (shardIndex, shardSize) {
        let _this = this;
        let file = _this.$refs.file.files[0];
        let start = (shardIndex - 1) * shardSize; //当前分片起始位置
        let end = Math.min(file.size, start + shardSize); //当前分片结束位置
        let fileShard = file.slice(start, end); //从文件中截取当前的分片数据
        return fileShard;
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
