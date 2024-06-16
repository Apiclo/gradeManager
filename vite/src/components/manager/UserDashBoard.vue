<script setup>

</script>

<template>
  <n-modal v-model:show="changePasswordDialog" :title="'更改密码'" preset="dialog">
    <n-input style="margin-top: 10px; margin-bottom: 10px" v-model:value="newPassword" placeholder="新密码" />
    <n-button @click="makeNewPassword">确定</n-button>
  </n-modal>
  <n-modal style="text-align: center;" v-model:show="newUserDialog" :title="'新建用户'" preset="dialog">
    <n-input round large style="margin-top: 10px; margin-bottom: 10px" v-model:value="userNo" placeholder="学号或工号" />
    <n-input round large style="margin-top: 10px; " v-model:value="username" placeholder="姓名" />
    <p style="margin-top: 20px">角色</p>
    <n-radio-group v-model:value="role" style="margin-bottom: 20px">
      <n-radio-button key="1" value="1" label="教师" />
      <n-radio-button key="0" value="0" label="管理员" />
      <n-radio-button key="2" value="2" label="学生" />
    </n-radio-group>
    <br />
    <n-button strong secondary round type="info" @click="addNewUser">确定</n-button>
  </n-modal>
  <n-space style="margin-bottom: 10px">
    <n-button strong secondary round type="info" @click="newUserDialog = true">新建用户</n-button>
  </n-space>
  <n-table>
    <thead>
      <tr>
        <th>UUID</th>
        <th>姓名</th>
        <th>角色</th>
        <th>操作</th>
      </tr>
    </thead>
    <tbody>
      <tr v-for="user in users" key="user">
        <td>{{ user.no }}</td>
        <td>{{ user.name }}</td>
        <td>{{ user.role }}</td>
        <td>
          <n-space :vertical="false">
            <n-button strong secondary round type="warning" @click="changePassword(user.no)">更改密码</n-button>
            <n-button strong secondary round type="error" @click="deleteUser(user.no)">移除用户</n-button>
          </n-space>

        </td>
      </tr>
    </tbody>
  </n-table>
  <div style="text-align: center; margin-top: 20px">
    <div style="display: inline-block">
      <n-pagination v-model:page="page" :page-count="pageNum" :on-update:page="p => { getByPage(p); page = p }" />
    </div>
  </div>
</template>
<script>
import axios from "axios";
import { ref } from "vue";
import qs from "qs";
let baseurl = 'http://' + window.location.host;
export default {
  name: 'user_manage',
  methods: {
    deleteUser(no) {
      let that = this
      axios.post(baseurl + "/api/user/delete-user", qs.stringify({ no: no })).then(r => {
        if (r.data.status === 0) {
          window.$message.success("删除完毕")
          that.getByPage(that.page)
        }
      })
    },
    addNewUser() {
      let that = this
      if (this.role === '' || this.username === '' || this.userNo === '') {
        window.$message.info("信息缺失")
      } else axios.post(baseurl + "/api/user/add-new-user", qs.stringify({ no: this.userNo, name: this.username, role: this.role })).then(r => {
        if (r.data.status === 0) {
          window.$message.success("添加成功")
          that.newUserDialog = false
          that.getByPage(that.page)
        } else {
          window.$message.error("添加失败, 号码不能相同")
        }
      })
    },
    makeNewPassword() {
      let that = this
      axios.post(baseurl + "/api/user/change-password", qs.stringify({ no: this.changingNo, newPass: this.newPassword })).then(r => {
        that.changePasswordDialog = false
        window.$message.success("密码已更改")
      })
    },
    changePassword(no) {
      this.changePasswordDialog = true
      this.changingNo = no
    },
    getByPage(page) {
      let that = this
      axios.get(baseurl + "/api/user/get-users-by-page?pageNum=" + page).then(r => {
        that.users = r.data.data.indices
        that.pageNum = r.data.data.pageNum
        that.users.forEach(r => {
          switch (r.role) {
            case 1: {
              r.role = '教师'
              break
            }
            case 0: {
              r.role = '管理员'
              break
            }
            case 2: {
              r.role = '学生'
              break
            }
          }
        })
      })
    }
  },
  data() {
    return {
      users: [],
      changePasswordDialog: false,
      changingNo: -1,
      newPassword: '',
      role: '',
      newUserDialog: false,
      userNo: '',
      username: '',
      pageNum: 0,
      page: 1
    }
  },
  mounted() {
    this.getByPage(1)
  }
}
</script>
<style scoped></style>