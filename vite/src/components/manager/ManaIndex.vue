<script setup>

</script>

<template>
  <n-layout position="absolute">
    <n-layout-header style="height: 64px;top:0px" bordered>
      <div class="titlec">
        <img class="logoi" height="36" src="/naivelogo.svg">
        <span class="titlei">成绩管理-管理端</span>
      </div>
      <div class="userinfo">

        你好, {{ name }}
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
export default {
  name: "admin_page",
  data() {
    return {
    }
  },
  methods: {
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
        label: () => h(RouterLink, { 'to': '/admin/user' }, () => "用户管理"),
        key: "user"
      },
      {
        label: () => h(RouterLink, { 'to': '/admin/course' }, () => "课程管理"),
        key: "course"
      },
      {
        label: () => h(RouterLink, { 'to': '/admin/teach' }, () => "教学管理"),
        key: "teach"
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