-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 66.502159 , 523.720581 , 43.260853 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(6046);
Camera:ScriptSplineAddTargetLookAtOffset(0,0,1.4);]] )
   Camera:MotionSpline_AddSplinePoint( 65.448204 , 522.168640 , 43.200855 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 64.398743 , 520.623352 , 43.190853 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 63.347050 , 519.074768 , 43.210854 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 20.000000 )
   Camera:MotionSpline_SetCorrection( -0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
