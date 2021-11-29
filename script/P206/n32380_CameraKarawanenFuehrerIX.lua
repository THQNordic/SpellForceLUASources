-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 412.385742 , 627.657471 , 51.526497 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8788);]] )
   Camera:MotionSpline_AddSplinePoint( 412.385742 , 627.657471 , 51.526497 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 412.385742 , 627.657471 , 51.526497 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 412.385742 , 627.657471 , 51.526497 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 412.385742 , 627.657471 , 51.526497 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 412.385742 , 627.657471 , 51.526497 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.585938 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
