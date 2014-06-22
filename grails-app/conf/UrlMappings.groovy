class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?(.$format)?"{
            constraints {
                // apply constraints here
            }
        }
        "/"(controller: 'user', action: 'dashBoard')

       // "/logout/$action?"(controller: "logout")

       // "/"(view:"/index")
        "500"(view:'/error')
	}
}
