-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 172.504272 , 543.944641 , 40.587440 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(148.312,547.838,27.350);]] )
   Camera:MotionSpline_AddSplinePoint( 171.725723 , 555.153320 , 40.587440 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 168.513916 , 560.552307 , 40.597435 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 156.704727 , 568.166931 , 41.335392 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
