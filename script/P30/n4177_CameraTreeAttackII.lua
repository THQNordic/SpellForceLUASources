-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 451.359680 , 354.015076 , 28.303410 , 24.900059 , [[Camera:ScriptSplineLookAtNpc(4177);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,3);]] )
   Camera:MotionSpline_AddSplinePoint( 442.938751 , 354.608154 , 27.523411 , 18.700035 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 434.480560 , 358.922577 , 27.503391 , 24.800058 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 428.688538 , 359.432098 , 28.193264 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 25.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
