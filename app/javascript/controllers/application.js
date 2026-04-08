// app/javascript/controllers/application.js
import { Application } from "@hotwired/stimulus"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

// Stimulus アプリケーションを起動
const application = Application.start()

// controllers フォルダから全コントローラーを自動読み込み
eagerLoadControllersFrom("controllers", application)

export { application }