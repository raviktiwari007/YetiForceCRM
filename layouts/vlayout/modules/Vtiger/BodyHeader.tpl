{*<!-- {[The file is published on the basis of YetiForce Public License that can be found in the following directory: licenses/License.html]} --!>*}
{strip}
    {assign var='count' value=0}
	{assign var="announcement" value=$ANNOUNCEMENT->get('announcement')}
	<div class="container-fluid bodyHeader noSpaces commonActionsContainer{if $LEFTPANELHIDE} open{/if}">
		<div class="row noSpaces">
			<div class="col-md-5 leftHeader">
				{*<div class="pull-left">
					{assign var=IMAGE value=$MODULE|cat:'48.png'}
					{if file_exists( vimage_path($IMAGE) )}
						<img src="{vimage_path($IMAGE)}" alt="{vtranslate($MODULE, $MODULE)}" class="moduleIcon" />
					{/if}
				</div>
				<h3 class="mainModuleTitle">{vtranslate($PAGETITLE, $QUALIFIED_MODULE)}</h3>*}
				{include file='BodyHidden.tpl'|@vtemplate_path:$MODULE}
			</div>
			<div class="col-md-7 rightHeader">
				<div class='actionMenu '>
					<div class="row">
						<div class="dropdown quickAction historyBtn">
							<div class="pull-left">
								{vtranslate('LBL_PAGES_HISTORY',$MODULE)}
							</div>						
							<div class="pull-right">
								<a data-placement="left" data-toggle="dropdown" class="btn btn-default btn-sm showHistoryBtn" aria-expanded="false" href="#">
									<img class='alignMiddle popoverTooltip' src="{vimage_path('history.png')}" alt="{vtranslate('LBL_PAGES_HISTORY',$MODULE)}" 
										class="dropdown-toggle" data-content="{vtranslate('LBL_PAGES_HISTORY')}" />
								</a>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="remindersNotice quickAction">
							<div class="pull-left">
								{vtranslate('LBL_CHAT',$MODULE)}
							</div>	
							<div class="pull-right">
								<a class="btn btn-default btn-sm" title="{vtranslate('LBL_CHAT',$MODULE)}" href="#">
									<span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
									<span class="badge hide">0</span>
								</a>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="headerLinksAJAXChat quickAction">
							<div class="pull-left">
								{vtranslate('LBL_CHAT',$MODULE)}
							</div>
							<div class="pull-right">
								<a class="btn btn-default btn-sm ChatIcon" title="{vtranslate('LBL_CHAT',$MODULE)}" href="#">
									<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
								</a>
							</div>
						</div>
					</div>
					{if !empty($announcement)}
						<div class="row">
							<div class="quickAction">
								<div class="pull-left">
									{vtranslate('LBL_ANNOUNCEMENT',$MODULE)}
								</div>
								<div class='pull-right'>
									<a class="btn btn-default btn-sm" href="#">
										<img class='alignMiddle imgAnnouncement' src="{vimage_path('btnAnnounceOff.png')}" alt="{vtranslate('LBL_ANNOUNCEMENT',$MODULE)}" title="{vtranslate('LBL_ANNOUNCEMENT',$MODULE)}" id="announcementBtn" />
									</a>
								</div>
							</div>
						</div>
					{/if}
				</div>
				<div class="pull-right rightHeaderBtn">
					<div class="dropdown quickAction historyBtn">
						<a data-placement="left" data-toggle="dropdown" class="btn btn-default btn-sm showHistoryBtn" aria-expanded="false" href="#">
							<img class='alignMiddle popoverTooltip' src="{vimage_path('history.png')}" alt="{vtranslate('LBL_PAGES_HISTORY',$MODULE)}" 
								 class="dropdown-toggle" data-content="{vtranslate('LBL_PAGES_HISTORY')}" />
						</a>
					</div>
				</div>
				<div class="pull-right rightHeaderBtn">
					<div class="remindersNotice quickAction">
						<a class="btn btn-default btn-sm" title="{vtranslate('LBL_CHAT',$MODULE)}" href="#">
							<span class="glyphicon glyphicon-bell" aria-hidden="true"></span>
							<span class="badge hide">0</span>
						</a>
					</div>
				</div>
				<div class="pull-right rightHeaderBtn">
					<div class="headerLinksAJAXChat quickAction">
						<a class="btn btn-default btn-sm ChatIcon" title="{vtranslate('LBL_CHAT',$MODULE)}" href="#">
							<span class="glyphicon glyphicon-comment" aria-hidden="true"></span>
						</a>
					</div>
				</div>
				{if !empty($announcement)}
					<div class="pull-right rightHeaderBtn">
						<div class="quickAction">
							<a class="btn btn-default btn-sm" href="#">
								<img class='alignMiddle imgAnnouncement' src="{vimage_path('btnAnnounceOff.png')}" alt="{vtranslate('LBL_ANNOUNCEMENT',$MODULE)}" title="{vtranslate('LBL_ANNOUNCEMENT',$MODULE)}" id="announcementBtn" />
							</a>
						</div>
					</div>
				{/if}
				<div class="pull-right rightHeaderBtn">
					<div class="dropdown quickAction">
						<a id="menubar_quickCreate" class="dropdown-toggle btn btn-default btn-sm" data-toggle="dropdown" title="{vtranslate('LBL_QUICK_CREATE',$MODULE)}" href="#">
							<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
						</a>
						<ul class="dropdown-menu dropdown-menu-right commonActionsButtonDropDown">
							<li id="quickCreateModules">
								<div class="panel-default">
									<div class="panel-heading">
										<h4 class="panel-title"><strong>{vtranslate('LBL_QUICK_CREATE',$MODULE)}</strong></h4>
									</div>
									<div class="panel-body paddingLRZero">
										{foreach key=NAME item=MODULEMODEL from=Vtiger_Module_Model::getQuickCreateModules(true)}
											{assign var='quickCreateModule' value=$MODULEMODEL->isQuickCreateSupported()}
											{assign var='singularLabel' value=$MODULEMODEL->getSingularLabelKey()}
											{if $singularLabel == 'SINGLE_Calendar'}
												{assign var='singularLabel' value='LBL_EVENT_OR_TASK'}
											{/if}	
											{if $quickCreateModule == '1'}
												{if $count % 3 == 0}
													<div class="">
													{/if}
													<div class="col-xs-4{if $count % 3 != 2} paddingRightZero{/if}">
														<a id="menubar_quickCreate_{$NAME}" class="quickCreateModule list-group-item" data-name="{$NAME}"
														   data-url="{$MODULEMODEL->getQuickCreateUrl()}" href="javascript:void(0)" title="{vtranslate($singularLabel,$NAME)}"><span>{vtranslate($singularLabel,$NAME)}</span></a>
													</div>
													{if $count % 3 == 2}
													</div>
												{/if}
												{assign var='count' value=$count+1}
											{/if}
										{/foreach}
									</div>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="pull-right selectSearch">
					<div class="input-group globalSearchInput">
						<span class="input-group-btn">
							<select class="chzn-select col-md-5" title="{vtranslate('LBL_SEARCH_MODULE', $MODULE_NAME)}" id="basicSearchModulesList" >
								<option value="" class="globalSearch_module_All">{vtranslate('LBL_ALL_RECORDS', $MODULE_NAME)}</option>
								{foreach key=MODULE_NAME item=fieldObject from=$SEARCHABLE_MODULES}
									{if isset($SEARCHED_MODULE) && $SEARCHED_MODULE eq $MODULE_NAME && $SEARCHED_MODULE !== 'All'}
										<option value="{$MODULE_NAME}" class="globalSearch_module_{$MODULE_NAME}" selected>{vtranslate($MODULE_NAME,$MODULE_NAME)}</option>
									{else}
										<option value="{$MODULE_NAME}" class="globalSearch_module_{$MODULE_NAME}">{vtranslate($MODULE_NAME,$MODULE_NAME)}</option>
									{/if}
								{/foreach}
							</select>
						</span>
						<input type="text" class="form-control" title="{vtranslate('LBL_GLOBAL_SEARCH')}" id="globalSearchValue" 
							   placeholder="{vtranslate('LBL_GLOBAL_SEARCH')}" results="10" />
						<span class="input-group-btn">
							<button class="btn btn-default" id="searchIcon" type="button">
								<span class="glyphicon glyphicon-search"></span>
							</button>
						</span>
						<span class="input-group-btn">
							<button class="btn btn-default" id="globalSearch" title="{vtranslate('LBL_ADVANCE_SEARCH')}" type="button">
								<span class="glyphicon glyphicon-th-large"></span>
							</button>
						</span>
					</div>
				</div>
				<div class="pull-right rightHeaderBtn">
					{assign var=CONFIG value=Settings_Mail_Config_Model::getConfig('mailIcon')}
					{assign var=AUTOLOGINUSERS value=OSSMail_Autologin_Model::getAutologinUsers()}
					{if $CONFIG['showMailIcon']=='true' && count($AUTOLOGINUSERS) > 0}
						{assign var=MAIN_MAIL value=OSSMail_Module_Model::getDefaultMailAccount($AUTOLOGINUSERS)}
						<div class="headerLinksMails" id="OSSMailBoxInfo" {if $CONFIG['showNumberUnreadEmails']=='true'}data-numberunreademails="true" data-interval="{$CONFIG['timeCheckingMail']}"{/if}>
							<div class="btn-group">
								<a type="button" class="btn btn-sm btn-default" title="{$MAIN_MAIL.username}" href="index.php?module=OSSMail&view=index">
									{$ITEM.username}
									<span class="mail_user_name">{$MAIN_MAIL.username}</span>
									<span class="noMails_{$MAIN_MAIL.rcuser_id}"></span>
								</a>
								{if $CONFIG['showMailAccounts']=='true'}
									<button type="button" class="btn btn-sm btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<span class="caret"></span>
										<span class="sr-only">Toggle Dropdown</span>
									</button>
									<ul class="dropdown-menu" role="menu">
										{foreach key=KEY item=ITEM from=$AUTOLOGINUSERS}
											<li data-id="{$KEY}" {if $ITEM.active}selested{/if}>
												<a href="#">
													{$ITEM.username} <span class="noMails"></span>
												</a>
											</li>
										{/foreach}
									</ul>
								{/if}
							</div>
						</div>
					{/if}
				</div>
				<div class="pull-right rightHeaderBtnMenu">
					<div class="quickAction">
						<a class="btn btn-default btn-sm" href="#">
							<span aria-hidden="true" class="glyphicon glyphicon-menu-hamburger"></span>
						</a>
					</div>
				</div>
				<div class="pull-right actionMenuBtn">
					<div class="quickAction">
						<a class="btn btn-default btn-sm" href="#">
							<span aria-hidden="true" class="glyphicon glyphicon-tasks"></span>
						</a>
					</div>
				</div>
				<div class="pull-right searchMenuBtn">
					<div class="quickAction">
						<a class="btn btn-default btn-sm" href="#">
							<span aria-hidden="true" class="glyphicon glyphicon-search"></span>
						</a>
					</div>
				</div>
			</div>
		</div>
		{if !empty($announcement)}
			<div class="row">
				{include file='Announcement.tpl'|@vtemplate_path:$MODULE}
			{/if}
		</div>
	{/strip}
