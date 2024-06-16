<script setup>

</script>

<template>
  <div style="height: 100%; text-align: center">
    <n-card class="logincard" title="成绩管理">
      <img height="80" src="/naivelogo.svg"><br />
      统一认证<br />
      <n-input size="large" round v-model:value="no" placeholder="学号或工号">
      </n-input>
      <n-input size="large" round type="password" v-model:value="password" placeholder="密码">
      </n-input>
      <n-button @click="login" strong secondary round type="info">登录</n-button>
    </n-card>
    <br />
    <n-card>
      <n-collapse arrow-placement="right">
        <n-collapse-item title="登录信息" name="1">
          <div>
            学生默认学号4100**<br />
            教师默认工号200**<br />
            <span class="manager-acc">管理员账号为10086</span><br />
            默认密码为12345,请在登陆后修改密码.<br />
            本信息栏仅作调试用
          </div>
        </n-collapse-item>
      </n-collapse>
    </n-card>
  </div>

</template>
<script>
import axios from "axios";
import qs from "qs";
import { useMessage } from "naive-ui";
let baseurl = 'http://' + window.location.host;
//获取当前host,避免写死127.0.0.1和localhost造成跨域
export default {
  name: 'index',
  data() {
    return {
      no: '',
      password: ''
    }
  },

  setup() {
    window.$message = useMessage()
  },
  methods: {
    login() {
      let that = this

      axios.post(baseurl + '/api/login', qs.stringify({ no: this.no, password: this.password })).then(r => {
        if (r.data.status === 0) {
          window.$message.success("登录成功")
          sessionStorage.setItem("name", r.data.data.split('/')[1])
          if (r.data.data.split('/')[0] === "0") {
            that.$router.replace("/admin")
          } else if (r.data.data.split('/')[0] === "1") {
            that.$router.replace("/teacher")
          } else if (r.data.data.split('/')[0] === "2") {
            that.$router.replace("/student")
          }
        } else window.$message.error("登录失败")
      }).catch(() => {
        window.$message.error("未知异常")
      })
    },
  }
}
</script>
<style scoped>
.logincard {
  height: 400px;
  margin-top: 20vh !important;

}

.n-input,
button {
  margin-top: 1.2em !important;
  width: 18em;
}

.n-card,
.logincard {
  width: 400px;
  margin-top: 2em;
  display: inline-block;
  box-shadow: 0px 4px 8px rgba(22, 80, 124, 0.546);
  border-radius: 8px;
}

.logincard:hover {
  box-shadow: 0px 6px 12px rgba(35, 126, 212, 0.546);

}

.manager-acc {
  color: #fff;
}

.manager-acc:hover {
  color: #000;
}
</style>