import Foundation
import ApolloCodegenLib

let parentFolderOfScriptFile = FileFinder.findParentFolder()
let sourceRootURL = parentFolderOfScriptFile
  .apollo.parentFolderURL() // Result: Sources folder
  .apollo.parentFolderURL() // Result: Codegen folder
  .apollo.parentFolderURL()
let cliFolderURL = sourceRootURL
  .apollo.childFolderURL(folderName: "Codegen")
  .apollo.childFolderURL(folderName: "ApolloCLI")

let endpoint = URL(string: "https://api.yelp.com/v3/graphql")!
let output = sourceRootURL
    .apollo.childFolderURL(folderName:"MealMatch/GraphQL")
let apiKey = "Z0Vp-LdYJ0NW2NBqz2m5PUZxytl40-CCHncJqLLa0hmTu7Q_ir7xDh_zHhqVSgu7HdlCM6tJYNgDuLk1VxgyW3teo0CLwWfbZfbn_XGvzyR3I4nJSlgFhOaV50bKX3Yx"

let targetURL = sourceRootURL
    .apollo.childFolderURL(folderName: "MealMatch/GraphQL")
let codegenOptions = ApolloCodegenOptions(targetRootURL: targetURL)

let schemaDownloadOptions = ApolloSchemaOptions(schemaFileName: "schema",
                                                schemaFileType: .json,
                                                apiKey: apiKey,
                                                endpointURL: endpoint,
                                                headers: ["Authorization: Bearer \(apiKey)"],
                                                outputFolderURL: output,
                                                downloadTimeout: 100)
do {
    try ApolloSchemaDownloader.run(with: cliFolderURL,
                                 options: schemaDownloadOptions)
    try ApolloCodegen.run(from: targetURL,
                              with: cliFolderURL,
                              options: codegenOptions)
} catch {
  exit(1)
}
