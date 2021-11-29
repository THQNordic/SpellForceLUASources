-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 611.000122 , 389.113708 , 29.226316 , 9.900002 , [[Camera:ScriptSplineLookAtNpc(6738);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.6);]] )
   Camera:MotionSpline_AddSplinePoint( 614.208435 , 389.271881 , 29.226316 , 5.699997 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 616.291748 , 390.475525 , 29.226316 , 9.800001 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 618.219238 , 393.828430 , 29.226316 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
