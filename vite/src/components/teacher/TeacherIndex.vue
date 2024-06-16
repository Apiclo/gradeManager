<script setup>

</script>

<template>
  <n-modal style="text-align: center;" v-model:show="changePassDialog" preset="dialog" title="修改密码">
    <n-space vertical>
      <n-input round large type="password" v-model:value="oldPass" placeholder="旧密码"></n-input>
      <n-input round large type="password" v-model:value="newPass" placeholder="新密码"></n-input>
      <n-input round large type="password" v-model:value="confirmPass" placeholder="确认新密码"></n-input>
      <n-button round secondary strong type="primary" @click="changePass">确认</n-button>
    </n-space>
  </n-modal>
  <n-layout position="absolute">
    <n-layout-header style="height: 64px;top:0px" bordered>
      <div class="titlec">
        <img class="logoi" height="36" src="/naivelogo.svg">
        <span class="titlei">成绩管理-教师端</span>
      </div>
      <div class="userinfo">
        你好, {{ name }}
        <n-button round tertiary type="warning" style="margin: 0px 5px 0px 5px"
          @click="changePassDialog = true">修改密码</n-button>
        <n-button round tertiary type="error" @click="logout">退出</n-button>
      </div>
    </n-layout-header>
    <n-layout has-sider position="absolute" style="top: 64px; bottom: 64px">
      <n-layout-sider bordered content-style="padding: 4px;">
        <n-menu :options="menuOptions"></n-menu>
      </n-layout-sider>
      <n-layout content-style="padding: 24px;">
        <router-view />
      </n-layout>
    </n-layout>
    <n-layout-footer bordered position="absolute" style="height: 64px; padding: 24px; text-align: center">
      gradeManagement &nbsp; 成绩管理
    </n-layout-footer>
  </n-layout>
</template>
<script>
import { h } from "vue";
import { RouterLink } from "vue-router";
import { useMessage } from "naive-ui";
import axios from "axios";
import qs from "qs";
let baseurl = 'http://' + window.location.host;
export default {
  name: "teacher_page",
  data() {
    return {
      oldPass: '',
      newPass: '',
      confirmPass: '',
      changePassDialog: false
    }
  },
  methods: {
    changePass() {
      if (this.newPass !== this.confirmPass) {
        window.$message.error("两次密码输入不一致")
        return
      }
      if (this.newPass === '') {
        window.$message.error("新密码不能为空")
      }
      let that = this
      axios.post(baseurl + "/api/login/change-password", qs.stringify({ oldPass: this.oldPass, newPass: this.newPass }, { withCredentials: true })).then(r => {
        if (r.data.status === 0) {
          window.$message.success("密码已更改")
          that.changePassDialog = false
        } else {
          window.$message.error("密码修改失败, 原密码错误")
        }
      })
    },
    logout() {
      sessionStorage.clear()
      this.$router.replace('/index')
    }
  },
  setup() {
    console.log(sessionStorage.getItem("name"))
    let name = sessionStorage.getItem("name")
    window.$message = useMessage()
    let menuOptions = [
      {
        label: () => h(RouterLink, { 'to': '/teacher/record' }, () => "成绩录入"),
        key: "course"
      },
    ]
    return {
      menuOptions: menuOptions,
      name: name
    }
  }
}

</script>
<style scoped></style>