import{_ as e,c as t,o as i,V as o}from"./chunks/framework.gBlNPWt_.js";const f=JSON.parse('{"title":"Code Review Guidelines","description":"","frontmatter":{},"headers":[],"relativePath":"devdoc/CodeReviews.md","filePath":"devdoc/CodeReviews.md","lastUpdated":1717168026000}'),a={name:"devdoc/CodeReviews.md"},s=o('<h1 id="code-review-guidelines" tabindex="-1">Code Review Guidelines <a class="header-anchor" href="#code-review-guidelines" aria-label="Permalink to &quot;Code Review Guidelines&quot;">​</a></h1><p>The <a href="./CodeSubmissions.html">Code Submissions</a> document is aimed at developers that are submitting PRs. This document describes some of the goals and expectations for code reviewers.</p><h2 id="review-goals" tabindex="-1">Review Goals <a class="header-anchor" href="#review-goals" aria-label="Permalink to &quot;Review Goals&quot;">​</a></h2><p>Code reviews have a few different goals:</p><ul><li>Catch architectural or design problems.<br> These should have been caught earlier, but better later than never...</li><li>Catch bugs early (incorrect behaviour, inefficiencies, security issues)</li><li>Ensure the code is readable and maintainable.<br> This includes following the project coding standards (see <a href="./StyleGuide.html">Style Guide</a>).</li><li>A opportunity for training/passing on information.<br> For example providing information about how the current system works, functionality that is already available or suggestions of other approaches the developer may not have thought of.</li></ul><p>It is <strong>NOT</strong> a goal to change the submission until it matches how the reviewer would have coded it.</p><h2 id="general-comments" tabindex="-1">General comments <a class="header-anchor" href="#general-comments" aria-label="Permalink to &quot;General comments&quot;">​</a></h2><p>Some general comments on code reviews:</p><ul><li>Code reviewers should be explicit and clearly describe the problem.<br> This should include what change is expected if not obvious. Don’t assume the contributor has same understanding/view as reviewer.</li><li>If a comment is not clear the contributor should ask for clarification.<br> ...rather than wasting time trying to second-guess the reviewer.</li><li>Contributors should feel free to push back if they consider comments are too picky.<br> The reviewer can either agree, or provide reasons why they consider it to be an issue.</li><li>The reviewer should not extend the scope of the original change.<br> If the change could be extended, or only partially solves the issue, a new JIRA should be created for the extra work. If the change will introduce regressions, or fundamentally fails to solve the problem then this does not apply!</li><li>Clearly indicate if a review is incomplete.<br> Sometimes a significant design problem means the rest of the code has not been reviewed in detail. Other times an initial review has picked up a set of issues, but the reviewer needs to go back and check other aspects in detail. If this is the case it should be explicitly noted.</li><li>Repeated issues.<br> The reviewer is free to comment on every instance of a repeated issue, but a simple annotation should alert contributor to address appropriately eg: [Please address all instances of this issue]</li><li>Contributers should provide feedback to the reviewer.<br> The contributor should respond to a comment if it isn&#39;t obvious where/how they have been addressed (but no need to acknowledge typo/indentation/etc)</li><li>Only the reviewer should mark issues as resolved using the Github resolve conversation button.</li><li>Code reviews should be a priority.<br> Both reviewers and contributors should respond in a timely manner - don&#39;t leave it for days. It destroys the flow of thought and conversation.</li><li>Check all review comments have been addressed.<br> If they have not been addressed you are guaranteed another review/submit cycle. In particular watch out for collapsed conversations. If there are large numbers of comments GitHub will collapse them, which can make comments easy to miss.</li><li>Sometimes PRs need to be restarted.<br> If there are large number of comments &gt; 100, it can be hard to track all the comments and GitHub can become unresponsive. It may be better to close the PR and open a new one.</li><li>Submit any changes as extra commits. This makes it clear to the reviewer what has changed, and avoids them having to re-review everything. Please do not squash them until the reviewers approve the PR. The few exceptions to this are if the PR is only a couple of lines, or the PR is completely rewritten in response to the review.</li><li>Reviewers use GitHub&#39;s features<br> Making use of the &quot;viewed&quot; button can make it easier to track what has changed - or quickly remove trivial changes from view. Ignoring whitespace can often simplify comparisons - especially when code has been refactored or extra conditions or try/catch bocks have been introduced.</li></ul><h2 id="strictness" tabindex="-1">Strictness <a class="header-anchor" href="#strictness" aria-label="Permalink to &quot;Strictness&quot;">​</a></h2><p>All code reviews don&#39;t need to be equally strict. The &quot;strictness&quot; of the review should reflect the importance and location of the change. Some examples:</p><ul><li>If it is closely associated with an existing file, then the indentation, style should match the surrounding code - a mixture of styles makes it much harder to read. If it is in a new, independent source file or project this is less of an issue.</li><li>If the code is in a core library then efficiency and edge cases will be more important.</li><li>If it is a core part of the system then security is key. If it is a developer only tool then edge cases are less significant.</li><li>Reviews of draft pull requests are likely to concentrate on the overall approach, rather than the details. They are likely to be more informal (e.g. not always using comments tags).</li></ul><h2 id="checklist" tabindex="-1">Checklist <a class="header-anchor" href="#checklist" aria-label="Permalink to &quot;Checklist&quot;">​</a></h2><p>What are some examples of checks to bear in mind when reviewing code?</p><p>General:</p><ul><li>Is the commit title in the correct format, and understandable in a change log?</li><li>Is the target correct?</li><li>Is the size appropriate. Could it have been split up?</li><li>Does the jira contain details of the change, especially the reason?</li><li>Does it duplicate other functionality?</li><li>Does the style match the context and the style guide?</li><li>Is the design encapsulated at the right level? Too abstract or too concrete?</li></ul><p>Content:</p><ul><li>Silly mistakes - indent, typos, commented outcode, spurious changes.</li><li>Does it introduce any memory leaks? E.g. Correct use of linking? Are exceptions released?</li><li>Thread safety <ul><li>critical sections or atomic variables if accessed by more than one thread</li><li>race conditions</li><li>deadlock</li></ul></li><li>authorization. Should it be checked, does it fail by default?</li><li>Any potential for overflow or DOS? Are all user inputs validated and all lengths protected?</li><li>Are all secrets stored and passed securely?</li><li>Comments explaining why for any code that is complex or counter-intuitive.</li><li>Backward compatibility.<br> Could this possibly cause problems if data produced with this change is used in earlier/later versions? Could there be problems if it was used in a mixed-version environment?</li></ul><h2 id="comment-tags" tabindex="-1">Comment tags <a class="header-anchor" href="#comment-tags" aria-label="Permalink to &quot;Comment tags&quot;">​</a></h2><p>When reading comments in a review it can sometimes be hard to know why the reviewer made a comment, or what response is expected. If there is any doubt the contributor should ask. However to make it clearer we are aiming to always add a tag to the front of each review comment. The tag will give an indication of why the comment is being made, its severity and what kind of response is expected. Here is a provisional table of tags:</p><table><thead><tr><th>Tag</th><th>What</th><th>Why</th><th>Expected response</th></tr></thead><tbody><tr><td>design:</td><td>An architectural or design issue</td><td>The reviewer considers the PR has a significant problem which will affect its functionality or future extensibility</td><td>reviewer/developer redesign expected before any further changes</td></tr><tr><td>scope:</td><td>The scope of the PR does not match the Jira</td><td>If the scope of the fix is too large it can be hard to review, and take much longer to resolve all the issues before the PR is accepted.</td><td>Discussion. Split the PR into multiple simpler PRs.</td></tr><tr><td>function:</td><td>Incorrect/unexpected functionality implemented</td><td>The function doesn&#39;t match the description in the jira, or doesn&#39;t solve the original problem</td><td>developer expected to address issue (or discuss)</td></tr><tr><td>security:</td><td>Something in the code introduces a security problem</td><td>The reviewer has spotted potential security issues e.g. injection attacks</td><td>developer expected to discuss the issue (and then address)</td></tr><tr><td>bug:</td><td>A coding issue that will cause incorrect behaviour</td><td>Likely to cause confusion, invalid results or crashes.</td><td>developer expected to address issue</td></tr><tr><td>efficiency:</td><td>The code works, but may have scaling or other efficiency issues.</td><td>Inefficiency can cause problem in some key functions and areas</td><td>developer addressing the problem (or discuss)</td></tr><tr><td>discuss:</td><td>Reviewer has thought of a potential problem, but not sure if it applies</td><td>Reviewer has a concern it may be an issue, and wants to check the developer has thought about and addressed the issue</td><td>Discussion - either in the PR or offline.</td></tr><tr><td></td><td></td><td></td><td></td></tr><tr><td>style:</td><td>Reviewer points out non-conforming code style</td><td>Makes the code hard to read</td><td>Developer to fix</td></tr><tr><td>indent:</td><td>A fairly obvious indentation issue</td><td>Makes the code hard to read</td><td>Developer to fix.</td></tr><tr><td>format:</td><td>Any other unusual formatting</td><td>Makes the code hard to read</td><td>Developer to fix.</td></tr><tr><td>typo:</td><td>Minor typing error</td><td>Makes something (code/message/comment) harder to read</td><td>Developer to fix.</td></tr><tr><td>minor:</td><td>A minor issue that could be improved.</td><td>Education (the suggestion is better for a particular reason), or something simple to clean up at the same time as other changes</td><td>Developer recommended to fix, but unlikely to stop a merge</td></tr><tr><td>picky:</td><td>A very minor issue that could be improved, but is barely worth commenting on</td><td>Education, or something to clean up at the same time as other changes</td><td>Developer discretion to fix, wouldn&#39;t stop a merge</td></tr><tr><td></td><td></td><td></td><td></td></tr><tr><td>future:</td><td>An additional feature or functionality that fits in but should be done as a separate PR.</td><td>Ensure that missing functionality is tracked, but PRs are not held up by additional requirements.</td><td>Contributor to create Jira (unless trivial) and number noted in response.</td></tr><tr><td>question:</td><td>Review has a question that they are not sure of the answer to</td><td>Reviewer would like clarification to help understand the code or design. The answer may lead to further comments.</td><td>An answer to the question.</td></tr><tr><td>note:</td><td>Reviewer wants to pass on some information to the contributor which they may not know</td><td>Passing on knowledge/background</td><td>contributor should consider the note, but no change expected/required</td></tr><tr><td>personal:</td><td>Reviewer has an observation based on personal experience</td><td>Reviewer has comments that would improve the code, but not part of the style guide or required. E.g. patterns for guard conditions</td><td>Reflect on the suggestion, but no change expected.</td></tr><tr><td>documentation:</td><td>This change may have an impact on documentation</td><td>Make sure changes can be used</td><td>Contributor to create Jira describing the impact created, and number noted in response.</td></tr></tbody></table><p>The comments should always be constructive. The reviewer should have a reason for each of them, and be able to articulate the reason in the comment or when asked. &quot;I wouldn&#39;t have done it like that&quot; is not a good enough on its own!</p><p>Similarly there is a difference in opinion within the team on some style issues - e.g. standard libraries or jlib, inline or out of line functions, nested or non-nested classes. Reviews should try and avoid commenting on these unless there is a clear reason why they are significant (functionality, efficiency, compile time) and if so spell it out. Code reviewers should discuss any style issues that they consider should be universally adopted that are not in the <a href="./StyleGuide.html">style guide</a>.</p>',23),r=[s];function n(d,l,h,c,u,m){return i(),t("div",null,r)}const b=e(a,[["render",n]]);export{f as __pageData,b as default};
