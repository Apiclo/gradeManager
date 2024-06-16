import { createApp } from 'vue'
import App from './App.vue'
import naive from 'naive-ui'
import { createRouter, createWebHistory } from "vue-router";
import index from "@/components/index.vue";
//依赖
import ManaIndex from "@/components/manager/ManaIndex.vue";
import UserDashBoard from "@/components/manager/UserDashBoard.vue";
import CourseDashBoard from "@/components/manager/CourseDashBoard.vue";
import TeachDashBoard from "@/components/manager/TeachDashBoard.vue";
//管理员
import TeacherIndex from "@/components/teacher/TeacherIndex.vue";
import RecordGrade from "@/components/teacher/RecordGrade.vue";
//教师
import StudentIndex from "@/components/student/StudentIndex.vue";
import gradeView from "@/components/student/gradeView.vue";
//学生
import './assets/customize.css';
//自定义CSS
const app = createApp(App)
const routes = [{
    path: "/",
    redirect: "/index",
    children: [
        {
            path: "/index",
            component: index
        },
        {
            path: "/admin",
            component: ManaIndex,
            redirect: "/admin/user",
            children: [
                {
                    path: "user",
                    component: UserDashBoard
                },
                {
                    path: "course",
                    component: CourseDashBoard
                },
                {
                    path: "teach",
                    component: TeachDashBoard
                }
            ]
        },
        {
            path: "/teacher",
            component: TeacherIndex,
            redirect: "/teacher/record",
            children: [
                {
                    path: "record",
                    component: RecordGrade
                }
            ]
        },
        {
            path: "/student",
            component: StudentIndex,
            redirect: "/student/view",
            children: [
                {
                    path: "view",
                    component: gradeView
                }
            ]
        }
    ]
}]
const router = createRouter({ history: createWebHistory(), routes })
//022201230237王超磊
app.use(naive)
app.use(router)
app.mount("#app")
