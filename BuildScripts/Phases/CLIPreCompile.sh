# ensure we are using the correct wrappers
export PATH="./bin:$PATH"

ruby BuildScripts/Common/ParallelSwiftformat.rb

ruby BuildScripts/Common/ParallelSwiftlint.rb &

ruby BuildScripts/Common/LintStringsFiles.rb -f "${SRCROOT}/TemplateApp/Supporting Files/Localizable.strings" &

wait

# execute this script last because it's mutating files!
ruby BuildScripts/Common/ParallelSwiftlintAutocorrect.rb
