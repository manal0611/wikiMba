package com.example

import wikisimple.Role


class RoleController {

    def index() {
        respond Role.list(params)
    }

    def create() {
        respond new Role()
    }

    def save(Role role) {
        if (role.save(flush: true)) {
            redirect action: "index"
        } else {
            render(view: "create", model: [role: role])
        }
    }

    def delete(Long id) {
        def role = Role.get(id)
        if (role) {
            role.delete(flush: true)
        }
        redirect action: "index"
    }
}
