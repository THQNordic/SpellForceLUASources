-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 351.187500 , 178.601715 , 46.987087 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(5937);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 351.187500 , 178.601715 , 46.987087 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 351.187500 , 178.601715 , 46.987087 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 351.187500 , 178.601715 , 46.987087 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
