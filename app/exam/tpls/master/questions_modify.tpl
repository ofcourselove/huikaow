{x2;if:!$userhash}
{x2;include:header}
<body>
{x2;include:nav}
<div class="container-fluid">
	<div class="row-fluid">
		<div class="span2">
			{x2;include:menu}
		</div>
		<div class="span10" id="datacontent">
{x2;endif}
			<ul class="breadcrumb">
				<li><a href="index.php?{x2;$_app}-master">{x2;$apps[$_app]['appname']}</a> <span class="divider">/</span></li>
				<li><a href="index.php?{x2;$_app}-master-questions&page={x2;$page}{x2;$u}">普通试题管理</a> <span class="divider">/</span></li>
				<li class="active">修改普通试题</li>
			</ul>
			<ul class="nav nav-tabs">
				<li class="active">
					<a href="#">修改普通试题</a>
				</li>
				<li class="pull-right">
					<a href="index.php?{x2;$_app}-master-questions&page={x2;$page}{x2;$u}">普通试题管理</a>
				</li>
			</ul>
			<form action="index.php?exam-master-questions-modifyquestion" method="post" class="form-horizontal">
				<fieldset>
				<div class="control-group">
					<label class="control-label">章节：</label>
				  	<div class="controls">
				  		<textarea class="input-xxlarge" rows="4" needle="needle" min="1" msg="您最少需要选定一个章节" name="args[questionknowsid]" id="questionknowsid" readonly>{x2;tree:$question['questionknowsid'],know,kid}{x2;v:know['knowsid']}:{x2;v:know['knows']}{x2;enter}{x2;endif}</textarea>
					</div>
				</div>
				<div class="control-group">
			  		<div class="controls">
				  		<select class="combox" target="isectionselect" refUrl="?exam-master-questions-ajax-getsectionsbysubjectid&subjectid={value}">
			        		<option value="0">选择课程</option>
					  		{x2;tree:$subjects,subject,sid}
					  		<option value="{x2;v:subject['subjectid']}">{x2;v:subject['subject']}</option>
					  		{x2;endtree}
				  		</select>
				  		<select class="combox" id="isectionselect" target="iknowsselect" refUrl="?exam-master-questions-ajax-getknowsbysectionid&sectionid={value}">
				  			<option value="0">选择科目</option>
				  		</select>
				  		<select class="combox" id="iknowsselect">
				  		<option value="0">选择章节</option>
				  		</select>
					</div>
				</div>
				<div class="control-group">
			  		<div class="controls">
			  			<input type="button" class="btn" value="选定" onclick="javascript:setKnowsList('questionknowsid','iknowsselect','+');"/>
			  			<input type="button" class="btn" value="清除" onclick="javascript:setKnowsList('questionknowsid','iknowsselect','-');"/>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">题型：</label>
				  	<div class="controls">
					  	<select needle="needle" msg="您必须为要添加的试题选择一种题型" name="args[questiontype]" class="combox" onchange="javascript:setAnswerHtml($(this).find('option:selected').attr('rel'),'answerbox');">
					  		{x2;tree:$questypes,questype,qid}
					  		<option rel="{x2;if:v:questype['questsort']}0{x2;else}{x2;v:questype['questchoice']}{x2;endif}" value="{x2;v:questype['questid']}"{x2;if:v:questype['questid'] == $question['questiontype']} selected{x2;endif}>{x2;v:questype['questype']}</option>
					  		{x2;endtree}
					  	</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">所属子题型：</label>
				  	<div class="controls">
					  	<select name="args[questiontype_child]" class="combox">
					  		<option value="0" rel="0"{x2;if:$question['questiontype_child'] == 0} selected{x2;endif}>请选择</option>
					  		<option value="1" rel="1"{x2;if:$question['questiontype_child'] == 1} selected{x2;endif}>综合题</option>
					  		<option value="2" rel="2"{x2;if:$question['questiontype_child'] == 2} selected{x2;endif}>组合选择题</option>
					  		<option value="3" rel="3"{x2;if:$question['questiontype_child'] == 3} selected{x2;endif}>案例分析题</option>
					  		<option value="4" rel="4"{x2;if:$question['questiontype_child'] == 4} selected{x2;endif}>计算分析题</option>
					  	</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">题干：</label>
				  	<div class="controls">
					  	<textarea class="ckeditor" name="args[question]" id="question">{x2;$question['question']}</textarea>
					  	<span class="help-block">需要填空处请以()表示。</span>
					</div>
				</div>
				<div class="control-group" id="selecttext"{x2;if:$questypes[$question['questiontype']]['questsort'] || $questypes[$question['questiontype']]['questchoice'] == 5} style="display:none;"{x2;endif}>
					<label class="control-label">备选项：</label>
				  	<div class="controls">
					  	<textarea class="ckeditor" name="args[questionselect]" id="questionselect">{x2;$question['questionselect']}</textarea>
					  	<span class="help-block">无选择项的请不要填写，如填空题、问答题等主观题。</span>
					</div>
				</div>
				<div class="control-group" id="selectnumber"{x2;if:$questypes[$question['questiontype']]['questsort'] || $questypes[$question['questiontype']]['questchoice'] == 5} style="display:none;"{x2;endif}>
					<label for="questionselectnumber" class="control-label">备选项数量：</label>
				  	<div class="controls">
					  	<select name="args[questionselectnumber]" id="questionselectnumber">
					  		<option value="0"{x2;if:$question['questionselectnumber'] == 0} selected{x2;endif}>0</option>
					  		<option value="2"{x2;if:$question['questionselectnumber'] == 2} selected{x2;endif}>2</option>
					  		<option value="4"{x2;if:$question['questionselectnumber'] == 4} selected{x2;endif}>4</option>
					  		<option value="5"{x2;if:$question['questionselectnumber'] == 5} selected{x2;endif}>5</option>
					  		<option value="6"{x2;if:$question['questionselectnumber'] == 6} selected{x2;endif}>6</option>
					  	</select>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">参考答案：</label>
					<div class="controls">
						<div id="answerbox_1" class="answerbox"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 1 || $questypes[$question['questiontype']]['questsort']} style="display:none;"{x2;endif}>
						  	<label class="radio inline"><input type="radio" name="targs[questionanswer1]" value="A"{x2;if:$question['questionanswer'] == 'A'} checked{x2;endif}>A</label>
						  	<label class="radio inline"><input type="radio" name="targs[questionanswer1]" value="B"{x2;if:$question['questionanswer'] == 'B'} checked{x2;endif}>B</label>
						  	<label class="radio inline"><input type="radio" name="targs[questionanswer1]" value="C"{x2;if:$question['questionanswer'] == 'C'} checked{x2;endif}>C</label>
						  	<label class="radio inline"><input type="radio" name="targs[questionanswer1]" value="D"{x2;if:$question['questionanswer'] == 'D'} checked{x2;endif}>D</label>
						  	<label class="radio inline"><input type="radio" name="targs[questionanswer1]" value="E"{x2;if:$question['questionanswer'] == 'E'} checked{x2;endif}>E</label>
						</div>
						<div id="answerbox_2" class="answerbox"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 2} style="display:none;"{x2;endif}>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer2][]" value="A"{x2;if:strpos($question['questionanswer'],'A') !== false} checked{x2;endif}>A</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer2][]" value="B"{x2;if:strpos($question['questionanswer'],'B') !== false} checked{x2;endif}>B</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer2][]" value="C"{x2;if:strpos($question['questionanswer'],'C') !== false} checked{x2;endif}>C</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer2][]" value="D"{x2;if:strpos($question['questionanswer'],'D') !== false} checked{x2;endif}>D</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer2][]" value="E"{x2;if:strpos($question['questionanswer'],'E') !== false} checked{x2;endif}>E</label>
						</div>
						<div id="answerbox_3" class="answerbox"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 3} style="display:none;"{x2;endif}>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer3][]" value="A"{x2;if:strpos($question['questionanswer'],'A') !== false} checked{x2;endif}>A</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer3][]" value="B"{x2;if:strpos($question['questionanswer'],'B') !== false} checked{x2;endif}>B</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer3][]" value="C"{x2;if:strpos($question['questionanswer'],'C') !== false} checked{x2;endif}>C</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer3][]" value="D"{x2;if:strpos($question['questionanswer'],'D') !== false} checked{x2;endif}>D</label>
						  	<label class="checkbox inline"><input type="checkbox" name="targs[questionanswer3][]" value="E"{x2;if:strpos($question['questionanswer'],'E') !== false} checked{x2;endif}>E</label>
						</div>
						<div id="answerbox_4" class="controls"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 4} style="display:none;"{x2;endif}>
						  	<label class="radio inline"><input type="radio" name="targs[questionanswer4]" value="A"{x2;if:$question['questionanswer'] == 'A'} checked{x2;endif}>对</label>
						  	<label class="radio inline"><input type="radio" name="targs[questionanswer4]" value="B"{x2;if:$question['questionanswer'] == 'B'} checked{x2;endif}>错</label>
						</div>
						<div id="answerbox_5" class="answerbox"{x2;if:$questypes[$question['questiontype']]['questchoice'] != 5} style="display:none;"{x2;endif}>
						  	<input type="text" name="targs[questionanswer5]" value="{x2;$question['questionanswer']}" />
						  	<span class="red_note">*如有多个填空项，请按顺序依次已“|”符分割</span>
						</div>
						<div id="answerbox_0"{x2;if:!$questypes[$question['questiontype']]['questsort']} style="display:none;"{x2;endif} class="answerbox">
					  		<textarea cols="72" rows="7" class="ckeditor" id="questionanswer0" name="targs[questionanswer0]">{x2;$question['questionanswer']}</textarea>
						</div>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">习题解析：</label>
				  	<div class="controls">
				  		<textarea class="ckeditor" name="args[questiondescribe]" id="questiondescribe">{x2;$question['questiondescribe']}</textarea>
					</div>
				</div>
				<div class="control-group">
					<label class="control-label">难度：</label>
				  	<div class="controls">
					  	<select class="combox" name="args[questionlevel]" needle="needle" msg="您必须为要添加的试题设置一个难度">
					  		<option value="1"{x2;if:$question['questionlevel']==1} selected{x2;endif}>易</option>
					  		<option value="2"{x2;if:$question['questionlevel']==2} selected{x2;endif}>中</option>
					  		<option value="3"{x2;if:$question['questionlevel']==3} selected{x2;endif}>难</option>
					  	</select>
					</div>
				</div>
				<div class="control-group">
				  	<div class="controls">
					  	<button class="btn btn-primary" type="submit">提交</button>
					  	<input type="hidden" name="page" value="{x2;$page}"/>
					  	<input type="hidden" name="args[questionparent]" value="{x2;$questionparent}"/>
					  	<input type="hidden" name="questionid" value="{x2;$question['questionid']}"/>
					  	<input type="hidden" name="modifyquestion" value="1"/>
					  	{x2;tree:$search,arg,aid}
						<input type="hidden" name="search[{x2;v:key}]" value="{x2;v:arg}"/>
						{x2;endtree}
					</div>
				</div>
				</fieldset>
			</form>
{x2;if:!$userhash}
		</div>
	</div>
</div>
</body>
</html>
{x2;endif}