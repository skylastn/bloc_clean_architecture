import com.android.build.gradle.AppExtension

val android = project.extensions.getByType(AppExtension::class.java)

android.apply {
    flavorDimensions("flavor-type")

    productFlavors {
        create("development") {
            dimension = "flavor-type"
            applicationId = "com.company.opet.order.dev"
            resValue(type = "string", name = "app_name", value = "Opet Order Dev")
        }
        create("production") {
            dimension = "flavor-type"
            applicationId = "com.company.opet.order"
            resValue(type = "string", name = "app_name", value = "Opet Order")
        }
    }
}