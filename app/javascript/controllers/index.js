// NOTE: HotwireのControllerを読み込むファイル
import { application } from './application';

// TODO: import処理の自動化
import LayoutsHeaderComponentController from '../../components/layouts/header/component';
application.register('layouts--header--component', LayoutsHeaderComponentController);

import LayoutsBreadcrumbComponentController from '../../components/layouts/breadcrumb/component';
application.register('layouts--breadcrumb--component', LayoutsBreadcrumbComponentController);

import LayoutsNotyfComponentController from '../../components/layouts/notyf/component';
application.register('layouts--notyf--component', LayoutsNotyfComponentController);
