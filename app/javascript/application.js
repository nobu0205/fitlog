// Entrypoint
import "@hotwired/turbo-rails"
import { Application } from "@hotwired/stimulus"
import { eagerLoadControllersFrom } from "@hotwired/stimulus-loading"

// Stimulus application を作成
const application = Application.start()

// controllers フォルダから自動でコントローラーを読み込む
eagerLoadControllersFrom("controllers", application)

export { application }
